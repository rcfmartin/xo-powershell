# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /users
    #   /users/{id}

function Get-XoUser
{
    <#
    .SYNOPSIS
        List or query users.
    .DESCRIPTION
        Get Xen Orchestra users by ID or list existing users.
    .EXAMPLE
        Get-XoUser
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/users"
        $uri = "$script:XoHost/rest/v0/users/{id}"

        throw [System.NotImplementedException]::new("Get-XoUser is not implemented yet.")
    }
}
