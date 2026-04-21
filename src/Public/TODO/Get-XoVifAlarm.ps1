# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vifs/{id}/alarms

function Get-XoVifAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VIF.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VIF.
    .EXAMPLE
        Get-XoVifAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vifs/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVifAlarm is not implemented yet.")
    }
}
