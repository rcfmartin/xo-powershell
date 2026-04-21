# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-templates/{id}.{format}

function Export-XoVmTemplate
{
    <#
    .SYNOPSIS
        Export a VM template in a specific format.
    .DESCRIPTION
        Download a VM template in the requested export format from Xen Orchestra.
    .EXAMPLE
        Export-XoVmTemplate
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-templates/{id}.{format}"

        throw [System.NotImplementedException]::new("Export-XoVmTemplate is not implemented yet.")
    }
}
