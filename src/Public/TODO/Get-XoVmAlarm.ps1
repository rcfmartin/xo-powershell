# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/alarms

function Get-XoVmAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VM.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VM.
    .EXAMPLE
        Get-XoVmAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVmAlarm is not implemented yet.")
    }
}
