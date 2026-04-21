# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pbds/{id}/actions/plug

function Connect-XoPbd
{
    <#
    .SYNOPSIS
        Plug a PBD.
    .DESCRIPTION
        Plug the specified PBD so the SR becomes available on its host.
    .EXAMPLE
        Connect-XoPbd
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pbds/{id}/actions/plug"

        throw [System.NotImplementedException]::new("Connect-XoPbd is not implemented yet.")
    }
}
