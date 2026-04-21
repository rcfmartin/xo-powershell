# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdis/{id}/alarms

function Get-XoVdiAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VDI.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VDI.
    .EXAMPLE
        Get-XoVdiAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdis/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVdiAlarm is not implemented yet.")
    }
}
