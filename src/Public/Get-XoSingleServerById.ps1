# SPDX-License-Identifier: Apache-2.0

function Get-XoSingleServerById {
    param (
        [string]$ServerUuid,
        [hashtable]$Params
    )

    try {
        Write-Verbose "Getting server with ID $ServerUuid"
        $uri = "$script:XoHost/rest/v0/servers/$ServerUuid"

        if ($null -eq $Params) {
            $Params = @{}
        }
        if (-not $Params.ContainsKey('fields')) {
            $Params['fields'] = $script:XO_SERVER_FIELDS
        }

        $serverData = Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $Params

        if ($serverData) {
            return ConvertTo-XoServerObject -InputObject $serverData
        }
    }
    catch {
        throw ("Failed to retrieve server with ID {0}: {1}" -f $ServerUuid, $_)
    }
    return $null
}
