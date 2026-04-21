# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-controllers/{id}/tags/{tag}

function Set-XoVmControllerTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a VM controller.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra VM controller.
    .EXAMPLE
        Set-XoVmControllerTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-controllers/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoVmControllerTag is not implemented yet.")
    }
}
