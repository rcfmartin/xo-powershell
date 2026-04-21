# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-templates/{id}/vdis

function Get-XoVmTemplateVdi
{
    <#
    .SYNOPSIS
        List VDIs in a VM template.
    .DESCRIPTION
        Retrieve VDIs attached to a specific Xen Orchestra VM template.
    .EXAMPLE
        Get-XoVmTemplateVdi
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-templates/{id}/vdis"

        throw [System.NotImplementedException]::new("Get-XoVmTemplateVdi is not implemented yet.")
    }
}
