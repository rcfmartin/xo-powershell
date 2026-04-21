# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/actions/migrate

function Move-XoVm
{
    <#
    .SYNOPSIS
        Migrate a VM to another host.
    .DESCRIPTION
        Migrate the specified Xen Orchestra VM to a different host.
    .EXAMPLE
        Move-XoVm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/actions/migrate"

        throw [System.NotImplementedException]::new("Move-XoVm is not implemented yet.")
    }
}
