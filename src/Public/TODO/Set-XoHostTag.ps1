# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/tags/{tag}

function Set-XoHostTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a host.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra host.
    .EXAMPLE
        Set-XoHostTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoHostTag is not implemented yet.")
    }
}
