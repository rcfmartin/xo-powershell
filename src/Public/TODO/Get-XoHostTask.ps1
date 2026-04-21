# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/tasks

function Get-XoHostTask
{
    <#
    .SYNOPSIS
        List tasks for a host.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra host.
    .EXAMPLE
        Get-XoHostTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoHostTask is not implemented yet.")
    }
}
