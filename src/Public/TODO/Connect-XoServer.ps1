# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /servers/{id}/actions/connect

function Connect-XoServer
{
    <#
    .SYNOPSIS
        Connect a Xen Orchestra server.
    .DESCRIPTION
        Establish the connection to a specific registered XO server.
    .EXAMPLE
        Connect-XoServer
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/servers/{id}/actions/connect"

        throw [System.NotImplementedException]::new("Connect-XoServer is not implemented yet.")
    }
}
