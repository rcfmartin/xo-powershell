# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pcis
    #   /pcis/{id}

function Get-XoPci
{
    <#
    .SYNOPSIS
        List or query PCI devices.
    .DESCRIPTION
        Get Xen Orchestra PCI devices by UUID or list existing PCI devices.
    .EXAMPLE
        Get-XoPci
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pcis"
        $uri = "$script:XoHost/rest/v0/pcis/{id}"

        throw [System.NotImplementedException]::new("Get-XoPci is not implemented yet.")
    }
}
