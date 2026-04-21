# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-templates/{id}/tags/{tag}

function Set-XoVmTemplateTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a VM template.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra VM template.
    .EXAMPLE
        Set-XoVmTemplateTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-templates/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoVmTemplateTag is not implemented yet.")
    }
}
