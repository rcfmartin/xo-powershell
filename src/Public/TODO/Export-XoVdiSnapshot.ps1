# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdi-snapshots/{id}.{format}

function Export-XoVdiSnapshot
{
    <#
    .SYNOPSIS
        Export a VDI snapshot in a specific format.
    .DESCRIPTION
        Swagger-canonical variant using /vdi-snapshots/{id}.{format}. Existing Public\Export-XoVdiSnapshot uses /vdi-snapshots/{id}/export - merge once verified.
    .EXAMPLE
        Export-XoVdiSnapshot
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdi-snapshots/{id}.{format}"

        throw [System.NotImplementedException]::new("Export-XoVdiSnapshot is not implemented yet.")
    }
}
