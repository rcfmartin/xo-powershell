# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /networks/{id}/alarms

function Get-XoNetworkAlarm
{
    <#
    .SYNOPSIS
        List alarms for a network.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra network.
    .EXAMPLE
        Get-XoNetworkAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/networks/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoNetworkAlarm is not implemented yet.")
    }
}
