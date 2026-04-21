# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/actions/pause

function Invoke-XoVmPause
{
    <#
    .SYNOPSIS
        Pause a running VM.
    .DESCRIPTION
        Pause the specified VM (freeze CPU execution without saving state).
    .EXAMPLE
        Invoke-XoVmPause
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/actions/pause"

        throw [System.NotImplementedException]::new("Invoke-XoVmPause is not implemented yet.")
    }
}
