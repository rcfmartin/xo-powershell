# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vbds/{id}/actions/connect

function Connect-XoVbd
{
    <#
    .SYNOPSIS
        Connect (plug) a VBD.
    .DESCRIPTION
        Plug the specified VBD so its VM can access the underlying VDI.
    .EXAMPLE
        Connect-XoVbd
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vbds/{id}/actions/connect"

        throw [System.NotImplementedException]::new("Connect-XoVbd is not implemented yet.")
    }
}
