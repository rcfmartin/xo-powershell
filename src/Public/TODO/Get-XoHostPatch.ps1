# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/missing_patches

function Get-XoHostPatch
{
    <#
    .SYNOPSIS
        List missing patches for a host.
    .DESCRIPTION
        Retrieve the list of missing patches for a specific host.
    .EXAMPLE
        Get-XoHostPatch
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/missing_patches"

        throw [System.NotImplementedException]::new("Get-XoHostPatch is not implemented yet.")
    }
}
