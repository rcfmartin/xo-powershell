# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdis/{id}/tasks

function Get-XoVdiTask
{
    <#
    .SYNOPSIS
        List tasks for a VDI.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VDI.
    .EXAMPLE
        Get-XoVdiTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdis/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVdiTask is not implemented yet.")
    }
}
