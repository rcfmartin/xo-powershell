# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/actions/clone

function Copy-XoVm
{
    <#
    .SYNOPSIS
        Clone a VM.
    .DESCRIPTION
        Clone the specified Xen Orchestra VM.
    .EXAMPLE
        Copy-XoVm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/actions/clone"

        throw [System.NotImplementedException]::new("Copy-XoVm is not implemented yet.")
    }
}
