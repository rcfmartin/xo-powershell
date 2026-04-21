# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pifs/{id}/alarms

function Get-XoPifAlarm
{
    <#
    .SYNOPSIS
        List alarms for a PIF.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra PIF.
    .EXAMPLE
        Get-XoPifAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pifs/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoPifAlarm is not implemented yet.")
    }
}
