# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdis/{id}/messages

function Get-XoVdiMessage
{
    <#
    .SYNOPSIS
        List messages for a VDI.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VDI.
    .EXAMPLE
        Get-XoVdiMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdis/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoVdiMessage is not implemented yet.")
    }
}
