# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/actions/resume

function Resume-XoVm
{
    <#
    .SYNOPSIS
        Resume a suspended VM.
    .DESCRIPTION
        Resume the specified Xen Orchestra VM from suspension.
    .EXAMPLE
        Resume-XoVm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/actions/resume"

        throw [System.NotImplementedException]::new("Resume-XoVm is not implemented yet.")
    }
}
