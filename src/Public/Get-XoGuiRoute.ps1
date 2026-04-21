# SPDX-License-Identifier: Apache-2.0

function Get-XoGuiRoute
{
    <#
    .SYNOPSIS
        Get the gui-routes resource.
    .DESCRIPTION
        Retrieve the Xen Orchestra gui-routes resource.
    .EXAMPLE
        Get-XoGuiRoute
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.GuiRoute")]
    param ()

    process
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $uri = "$script:XoHost/rest/v0/gui-routes"
        ConvertTo-XoGuiRouteObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters)
    }
}
