# SPDX-License-Identifier: Apache-2.0

function Get-XoUserAuthenticationToken
{
    <#
    .SYNOPSIS
        List authentication tokens for the current user or a specific user.
    .DESCRIPTION
        Retrieves the API authentication tokens owned by a user (or the caller, if no -UserId is given). Each token includes the client id, description, creation/expiration timestamps and most recent use. Useful for auditing long-lived tokens created via xo-cli.
    .PARAMETER UserId
        Optional user UUID. When supplied, returns tokens belonging to that user. When omitted, returns the caller's own tokens via /users/authentication_tokens.
    .EXAMPLE
        Get-XoUserAuthenticationToken
    .EXAMPLE
        Get-XoUserAuthenticationToken -UserId '722d17b9-699b-49d2-8193-be1ac573d3de'
    #>
    [CmdletBinding(DefaultParameterSetName = "Self")]
    [OutputType("XoPowershell.UserAuthenticationToken")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "UserId")]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$UserId
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
        if ($PSCmdlet.ParameterSetName -eq "UserId")
        {
            foreach ($id in $UserId)
            {
                $uri = "$script:XoHost/rest/v0/users/$id/authentication_tokens"
                (Invoke-RestMethod -Uri $uri @script:XoRestParameters) | ConvertTo-XoUserAuthenticationTokenObject
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Self")
        {
            $uri = "$script:XoHost/rest/v0/users/authentication_tokens"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters) | ConvertTo-XoUserAuthenticationTokenObject
        }
    }
}

