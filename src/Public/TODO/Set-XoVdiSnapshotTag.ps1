# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdi-snapshots/{id}/tags/{tag}

function Set-XoVdiSnapshotTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a VDI snapshot.
    .DESCRIPTION
        Attach or detach a single tag from a specific Xen Orchestra VDI snapshot.
    .EXAMPLE
        Set-XoVdiSnapshotTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdi-snapshots/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoVdiSnapshotTag is not implemented yet.")
    }
}
