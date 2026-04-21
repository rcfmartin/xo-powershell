# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/stats

function Get-XoHostStat
{
    <#
    .SYNOPSIS
        Get statistics for a host.
    .DESCRIPTION
        Retrieve performance statistics for a specific host.
    .EXAMPLE
        Get-XoHostStat
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/stats"

        throw [System.NotImplementedException]::new("Get-XoHostStat is not implemented yet.")
    }
}
