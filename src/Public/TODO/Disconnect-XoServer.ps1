# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /servers/{id}/actions/disconnect

function Disconnect-XoServer
{
    <#
    .SYNOPSIS
        Disconnect a Xen Orchestra server.
    .DESCRIPTION
        Close the connection to a specific registered XO server.
    .EXAMPLE
        Disconnect-XoServer
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/servers/{id}/actions/disconnect"

        throw [System.NotImplementedException]::new("Disconnect-XoServer is not implemented yet.")
    }
}
