# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pools/{id}/tasks

function Get-XoPoolTask
{
    <#
    .SYNOPSIS
        List tasks for a pool.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra pool.
    .EXAMPLE
        Get-XoPoolTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pools/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoPoolTask is not implemented yet.")
    }
}
