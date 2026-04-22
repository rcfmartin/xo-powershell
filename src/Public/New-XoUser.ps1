# SPDX-License-Identifier: Apache-2.0

function New-XoUser
{
    <#
    .SYNOPSIS
        Create a new Xen Orchestra user.
    .DESCRIPTION
        Creates a new user via POST /users. Requires a name and password; permission defaults to 'none' (read-only).
    .PARAMETER Name
        The name (typically email) of the new user.
    .PARAMETER Password
        The plain-text password for the new user. Passed as-is to the XO REST endpoint.
    .PARAMETER Permission
        Permission level for the new user: 'none', 'viewer' (read-only), or 'admin'. Defaults to 'none'.
    .EXAMPLE
        New-XoUser -Name "alice@example.com" -Password "s3cret" -Permission viewer
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.User")]
    param (
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string]$Password,

        [Parameter()]
        [ValidateSet("none", "viewer", "admin")]
        [string]$Permission = "none"
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }
    }

    process
    {
        if (-not $PSCmdlet.ShouldProcess($Name, "create user"))
        {
            return
        }

        $params = @{
            name       = $Name
            password   = $Password
            permission = $Permission
        }
        $bodyJson  = ConvertTo-Json -InputObject $params -Depth 5 -Compress
        $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($bodyJson)

        $uri = "$script:XoHost/rest/v0/users"
        $response = Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters -ContentType "application/json" -Body $bodyBytes

        if ($response -is [string] -and $response -match '\/rest\/v0\/users\/([0-9a-f-]+)')
        {
            Get-XoUser -UserId $matches[1]
        }
        elseif ($response -and $response.PSObject.Properties.Name -contains 'id')
        {
            Get-XoUser -UserId $response.id
        }
        else
        {
            $response
        }
    }
}
