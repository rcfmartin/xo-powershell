# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /users/{id}/groups

function Get-XoUserGroup
{
    <#
    .SYNOPSIS
        List groups for a user.
    .DESCRIPTION
        Retrieve the groups a specific Xen Orchestra user belongs to.
    .EXAMPLE
        Get-XoUserGroup
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/users/{id}/groups"

        throw [System.NotImplementedException]::new("Get-XoUserGroup is not implemented yet.")
    }
}
