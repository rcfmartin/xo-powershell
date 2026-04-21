# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /networks/{id}/tags/{tag}

function Set-XoNetworkTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a network.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra network.
    .EXAMPLE
        Set-XoNetworkTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/networks/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoNetworkTag is not implemented yet.")
    }
}
