# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vbds/{id}/tasks

function Get-XoVbdTask
{
    <#
    .SYNOPSIS
        List tasks for a VBD.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VBD.
    .EXAMPLE
        Get-XoVbdTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vbds/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVbdTask is not implemented yet.")
    }
}
