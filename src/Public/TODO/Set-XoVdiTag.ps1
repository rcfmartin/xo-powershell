# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdis/{id}/tags/{tag}

function Set-XoVdiTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a VDI.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra VDI.
    .EXAMPLE
        Set-XoVdiTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdis/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoVdiTag is not implemented yet.")
    }
}
