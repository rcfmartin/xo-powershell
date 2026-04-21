# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-snapshots/{id}.{format}

function Export-XoVmSnapshot
{
    <#
    .SYNOPSIS
        Export a VM snapshot in a specific format.
    .DESCRIPTION
        Download a VM snapshot in the requested export format from Xen Orchestra.
    .EXAMPLE
        Export-XoVmSnapshot
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-snapshots/{id}.{format}"

        throw [System.NotImplementedException]::new("Export-XoVmSnapshot is not implemented yet.")
    }
}
