# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pbds/{id}/actions/unplug

function Disconnect-XoPbd
{
    <#
    .SYNOPSIS
        Unplug a PBD.
    .DESCRIPTION
        Unplug the specified PBD so the SR is no longer attached to its host.
    .EXAMPLE
        Disconnect-XoPbd
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pbds/{id}/actions/unplug"

        throw [System.NotImplementedException]::new("Disconnect-XoPbd is not implemented yet.")
    }
}
