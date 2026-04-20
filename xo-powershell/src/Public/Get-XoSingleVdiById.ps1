# SPDX-License-Identifier: Apache-2.0

function Get-XoSingleVdiById {
    param (
        [string]$VdiUuid,
        [hashtable]$Params
    )

    try {
        Write-Verbose "Getting VDI with UUID $VdiUuid"
        $uri = "$script:XoHost/rest/v0/vdis/$VdiUuid"
        $vdiData = Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $Params

        if ($vdiData) {
            return ConvertTo-XoVdiObject -InputObject $vdiData
        }
    }
    catch {
        throw ("Failed to retrieve VDI with UUID {0}: {1}" -f $VdiUuid, $_)
    }
    return $null
}
