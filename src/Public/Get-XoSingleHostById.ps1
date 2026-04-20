# SPDX-License-Identifier: Apache-2.0

function Get-XoSingleHostById {
    param (
        [string]$HostUuid,
        [hashtable]$Params
    )

    try {
        $uri = "$script:XoHost/rest/v0/hosts/$HostUuid"
        $params = @{ fields = $script:XO_HOST_FIELDS }
        $hostData = Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params

        if ($hostData) {
            return ConvertTo-XoHostObject -InputObject $hostData
        }
    }
    catch {
        throw ("Failed to retrieve host with UUID {0}: {1}" -f $HostUuid, $_)
    }
}
