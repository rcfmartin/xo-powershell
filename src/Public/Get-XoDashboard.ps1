# SPDX-License-Identifier: Apache-2.0

function Get-XoDashboard
{
    <#
    .SYNOPSIS
        Get the dashboard resource.
    .DESCRIPTION
        Retrieve the Xen Orchestra dashboard resource.
    .EXAMPLE
        Get-XoDashboard
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Dashboard")]
    param ()

    process
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $uri = "$script:XoHost/rest/v0/dashboard"
        ConvertTo-XoDashboardObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters)
    }
}
