# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /proxies
    #   /proxies/{id}

function Get-XoProxy
{
    <#
    .SYNOPSIS
        List or query proxies.
    .DESCRIPTION
        Get Xen Orchestra proxy instances by ID or list existing proxies.
    .EXAMPLE
        Get-XoProxy
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/proxies"
        $uri = "$script:XoHost/rest/v0/proxies/{id}"

        throw [System.NotImplementedException]::new("Get-XoProxy is not implemented yet.")
    }
}
