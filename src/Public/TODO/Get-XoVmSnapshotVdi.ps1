# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-snapshots/{id}/vdis

function Get-XoVmSnapshotVdi
{
    <#
    .SYNOPSIS
        List VDIs in a VM snapshot.
    .DESCRIPTION
        Retrieve VDIs captured in a specific Xen Orchestra VM snapshot.
    .EXAMPLE
        Get-XoVmSnapshotVdi
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-snapshots/{id}/vdis"

        throw [System.NotImplementedException]::new("Get-XoVmSnapshotVdi is not implemented yet.")
    }
}
