# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /gui-routes

function Get-XoGuiRoute
{
    <#
    .SYNOPSIS
        List GUI routes.
    .DESCRIPTION
        Retrieve the Xen Orchestra GUI route table.
    .EXAMPLE
        Get-XoGuiRoute
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/gui-routes"

        throw [System.NotImplementedException]::new("Get-XoGuiRoute is not implemented yet.")
    }
}
