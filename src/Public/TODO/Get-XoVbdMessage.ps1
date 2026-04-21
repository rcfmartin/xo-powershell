# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vbds/{id}/messages

function Get-XoVbdMessage
{
    <#
    .SYNOPSIS
        List messages for a VBD.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VBD.
    .EXAMPLE
        Get-XoVbdMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vbds/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoVbdMessage is not implemented yet.")
    }
}
