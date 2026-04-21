# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /tasks/{id}/actions/abort

function Stop-XoTask
{
    <#
    .SYNOPSIS
        Abort a running task.
    .DESCRIPTION
        Abort a running Xen Orchestra task.
    .EXAMPLE
        Stop-XoTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/tasks/{id}/actions/abort"

        throw [System.NotImplementedException]::new("Stop-XoTask is not implemented yet.")
    }
}
