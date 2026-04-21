# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pifs/{id}/tasks

function Get-XoPifTask
{
    <#
    .SYNOPSIS
        List tasks for a PIF.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra PIF.
    .EXAMPLE
        Get-XoPifTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pifs/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoPifTask is not implemented yet.")
    }
}
