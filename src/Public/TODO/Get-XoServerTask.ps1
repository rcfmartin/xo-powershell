# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /servers/{id}/tasks

function Get-XoServerTask
{
    <#
    .SYNOPSIS
        List tasks for a server.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra server.
    .EXAMPLE
        Get-XoServerTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/servers/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoServerTask is not implemented yet.")
    }
}
