# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-snapshots/{id}/messages

function Get-XoVmSnapshotMessage
{
    <#
    .SYNOPSIS
        List messages for a VM snapshot.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VM snapshot.
    .EXAMPLE
        Get-XoVmSnapshotMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-snapshots/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoVmSnapshotMessage is not implemented yet.")
    }
}
