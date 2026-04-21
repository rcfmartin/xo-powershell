# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pools/{id}/stats

function Get-XoPoolStat
{
    <#
    .SYNOPSIS
        Get statistics for a pool.
    .DESCRIPTION
        Retrieve performance statistics for a specific Xen Orchestra pool.
    .EXAMPLE
        Get-XoPoolStat
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pools/{id}/stats"

        throw [System.NotImplementedException]::new("Get-XoPoolStat is not implemented yet.")
    }
}
