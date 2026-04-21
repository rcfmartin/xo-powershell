# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/vdis

function Get-XoSrVdi
{
    <#
    .SYNOPSIS
        List VDIs on an SR.
    .DESCRIPTION
        Retrieve VDIs hosted on a specific storage repository.
    .EXAMPLE
        Get-XoSrVdi
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/vdis"

        throw [System.NotImplementedException]::new("Get-XoSrVdi is not implemented yet.")
    }
}
