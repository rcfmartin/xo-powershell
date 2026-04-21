# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vifs/{id}/tasks

function Get-XoVifTask
{
    <#
    .SYNOPSIS
        List tasks for a VIF.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VIF.
    .EXAMPLE
        Get-XoVifTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vifs/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVifTask is not implemented yet.")
    }
}
