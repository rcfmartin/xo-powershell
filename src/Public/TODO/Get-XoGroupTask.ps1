# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /groups/{id}/tasks

function Get-XoGroupTask
{
    <#
    .SYNOPSIS
        List tasks for a group.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra group.
    .EXAMPLE
        Get-XoGroupTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/groups/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoGroupTask is not implemented yet.")
    }
}
