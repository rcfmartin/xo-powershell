# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/tags/{tag}

function Set-XoVmTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a VM.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra VM.
    .EXAMPLE
        Set-XoVmTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoVmTag is not implemented yet.")
    }
}
