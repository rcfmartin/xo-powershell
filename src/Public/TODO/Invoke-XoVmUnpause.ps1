# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/actions/unpause

function Invoke-XoVmUnpause
{
    <#
    .SYNOPSIS
        Unpause a paused VM.
    .DESCRIPTION
        Unpause the specified VM that was previously paused.
    .EXAMPLE
        Invoke-XoVmUnpause
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/actions/unpause"

        throw [System.NotImplementedException]::new("Invoke-XoVmUnpause is not implemented yet.")
    }
}
