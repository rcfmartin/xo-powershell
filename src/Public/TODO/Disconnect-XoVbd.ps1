# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vbds/{id}/actions/disconnect

function Disconnect-XoVbd
{
    <#
    .SYNOPSIS
        Disconnect (unplug) a VBD.
    .DESCRIPTION
        Unplug the specified VBD from its VM.
    .EXAMPLE
        Disconnect-XoVbd
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vbds/{id}/actions/disconnect"

        throw [System.NotImplementedException]::new("Disconnect-XoVbd is not implemented yet.")
    }
}
