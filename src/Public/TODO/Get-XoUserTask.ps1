# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /users/{id}/tasks

function Get-XoUserTask
{
    <#
    .SYNOPSIS
        List tasks for a user.
    .DESCRIPTION
        Retrieve tasks owned by a specific Xen Orchestra user.
    .EXAMPLE
        Get-XoUserTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/users/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoUserTask is not implemented yet.")
    }
}
