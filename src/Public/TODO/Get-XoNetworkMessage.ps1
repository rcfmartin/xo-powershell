# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /networks/{id}/messages

function Get-XoNetworkMessage
{
    <#
    .SYNOPSIS
        List messages for a network.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra network.
    .EXAMPLE
        Get-XoNetworkMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/networks/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoNetworkMessage is not implemented yet.")
    }
}
