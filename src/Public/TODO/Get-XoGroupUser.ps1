# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /groups/{id}/users
    #   /groups/{id}/users/{userId}

function Get-XoGroupUser
{
    <#
    .SYNOPSIS
        List or query group members.
    .DESCRIPTION
        Get users that belong to a specific Xen Orchestra group by user ID or list them.
    .EXAMPLE
        Get-XoGroupUser
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/groups/{id}/users"
        $uri = "$script:XoHost/rest/v0/groups/{id}/users/{userId}"

        throw [System.NotImplementedException]::new("Get-XoGroupUser is not implemented yet.")
    }
}
