# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /users/{id}/authentication_tokens
    #   /users/authentication_tokens

function Get-XoUserAuthenticationToken
{
    <#
    .SYNOPSIS
        List user authentication tokens.
    .DESCRIPTION
        Retrieve authentication tokens for a specific user or the caller.
    .EXAMPLE
        Get-XoUserAuthenticationToken
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/users/{id}/authentication_tokens"
        $uri = "$script:XoHost/rest/v0/users/authentication_tokens"

        throw [System.NotImplementedException]::new("Get-XoUserAuthenticationToken is not implemented yet.")
    }
}
