# SPDX-License-Identifier: Apache-2.0

function Get-XoSingleVmById {
    param (
        [string]$VmUuid
    )

    try {
        $uri = "$script:XoHost/rest/v0/vms/$VmUuid"
        $params = @{ fields = $script:XO_VM_FIELDS }
        $vmData = Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params

        if ($vmData) {
            return ConvertTo-XoVmObject -InputObject $vmData
        }
    }
    catch {
        throw ("Failed to retrieve VM with UUID {0}: {1}" -f $VmUuid, $_)
    }
    return $null
}
