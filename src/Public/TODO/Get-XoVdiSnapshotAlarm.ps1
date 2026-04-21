# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdi-snapshots/{id}/alarms

function Get-XoVdiSnapshotAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VDI snapshot.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VDI snapshot.
    .EXAMPLE
        Get-XoVdiSnapshotAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdi-snapshots/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVdiSnapshotAlarm is not implemented yet.")
    }
}
