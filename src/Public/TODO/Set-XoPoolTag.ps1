# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pools/{id}/tags/{tag}

function Set-XoPoolTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a pool.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra pool.
    .EXAMPLE
        Set-XoPoolTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pools/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoPoolTag is not implemented yet.")
    }
}
