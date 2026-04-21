# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/alarms

function Get-XoHostAlarm
{
    <#
    .SYNOPSIS
        List alarms for a host.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra host.
    .EXAMPLE
        Get-XoHostAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoHostAlarm is not implemented yet.")
    }
}
