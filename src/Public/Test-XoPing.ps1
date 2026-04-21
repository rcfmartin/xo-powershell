# SPDX-License-Identifier: Apache-2.0

function Test-XoPing
{
    <#
    .SYNOPSIS
        Ping the Xen Orchestra REST API.
    .DESCRIPTION
        Test reachability of the Xen Orchestra REST API by hitting the /ping endpoint.
        Returns $true if the endpoint responds successfully, $false otherwise.
    .EXAMPLE
        Test-XoPing
    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param ()

    if (-not $script:XoHost -or -not $script:XoRestParameters)
    {
        throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
    }

    try
    {
        $null = Invoke-RestMethod -Uri "$script:XoHost/rest/v0/ping" @script:XoRestParameters
        return $true
    }
    catch
    {
        Write-Verbose "Ping failed: $_"
        return $false
    }
}
