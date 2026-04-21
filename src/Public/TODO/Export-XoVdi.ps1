# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdis/{id}.{format}

function Export-XoVdi
{
    <#
    .SYNOPSIS
        Export a VDI in a specific format.
    .DESCRIPTION
        Swagger-canonical variant using /vdis/{id}.{format}. Existing Public\Export-XoVdi uses /vdis/{id}/export - merge once verified.
    .EXAMPLE
        Export-XoVdi
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdis/{id}.{format}"

        throw [System.NotImplementedException]::new("Export-XoVdi is not implemented yet.")
    }
}
