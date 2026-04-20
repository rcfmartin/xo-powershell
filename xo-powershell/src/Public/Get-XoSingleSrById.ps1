# SPDX-License-Identifier: Apache-2.0

function Get-XoSingleSrById {
    param (
        [string]$SrUuid,
        [hashtable]$Params
    )

    try {
        Write-Verbose "Getting SR with UUID $SrUuid"
        $uri = "$script:XoHost/rest/v0/srs/$SrUuid"
        $srData = Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $Params

        if ($srData) {
            return ConvertTo-XoSrObject -InputObject $srData
        }
    }
    catch {
        throw ("Failed to retrieve SR with UUID {0}: {1}" -f $SrUuid, $_)
    }
    return $null
}
