# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /groups
    #   /groups/{id}

function Get-XoGroup
{
    <#
    .SYNOPSIS
        List or query groups.
    .DESCRIPTION
        Get Xen Orchestra groups by ID or list existing groups.
    .EXAMPLE
        Get-XoGroup
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/groups"
        $uri = "$script:XoHost/rest/v0/groups/{id}"

        throw [System.NotImplementedException]::new("Get-XoGroup is not implemented yet.")
    }
}
