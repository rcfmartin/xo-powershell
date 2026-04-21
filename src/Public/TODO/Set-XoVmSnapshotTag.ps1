# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-snapshots/{id}/tags/{tag}

function Set-XoVmSnapshotTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a VM snapshot.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra VM snapshot.
    .EXAMPLE
        Set-XoVmSnapshotTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-snapshots/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoVmSnapshotTag is not implemented yet.")
    }
}
