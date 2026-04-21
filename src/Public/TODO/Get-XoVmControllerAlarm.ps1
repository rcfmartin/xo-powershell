# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-controllers/{id}/alarms

function Get-XoVmControllerAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VM controller.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VM controller.
    .EXAMPLE
        Get-XoVmControllerAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-controllers/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVmControllerAlarm is not implemented yet.")
    }
}
