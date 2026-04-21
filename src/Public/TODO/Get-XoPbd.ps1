# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pbds
    #   /pbds/{id}

function Get-XoPbd
{
    <#
    .SYNOPSIS
        List or query PBDs.
    .DESCRIPTION
        Get Xen Orchestra physical block devices by UUID or list existing PBDs.
    .EXAMPLE
        Get-XoPbd
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pbds"
        $uri = "$script:XoHost/rest/v0/pbds/{id}"

        throw [System.NotImplementedException]::new("Get-XoPbd is not implemented yet.")
    }
}
