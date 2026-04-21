# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdi-snapshots/{id}/messages

function Get-XoVdiSnapshotMessage
{
    <#
    .SYNOPSIS
        List messages for a VDI snapshot.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VDI snapshot.
    .EXAMPLE
        Get-XoVdiSnapshotMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdi-snapshots/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoVdiSnapshotMessage is not implemented yet.")
    }
}
