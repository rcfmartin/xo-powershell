# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}.{format}

function Export-XoVm
{
    <#
    .SYNOPSIS
        Export a VM in a specific format.
    .DESCRIPTION
        Download a VM in the requested export format from Xen Orchestra.
    .EXAMPLE
        Export-XoVm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}.{format}"

        throw [System.NotImplementedException]::new("Export-XoVm is not implemented yet.")
    }
}
