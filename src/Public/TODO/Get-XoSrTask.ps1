# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/tasks

function Get-XoSrTask
{
    <#
    .SYNOPSIS
        List tasks for an SR.
    .DESCRIPTION
        Retrieve tasks associated with a specific storage repository.
    .EXAMPLE
        Get-XoSrTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoSrTask is not implemented yet.")
    }
}
