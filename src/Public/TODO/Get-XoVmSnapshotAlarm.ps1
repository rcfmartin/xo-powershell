# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-snapshots/{id}/alarms

function Get-XoVmSnapshotAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VM snapshot.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VM snapshot.
    .EXAMPLE
        Get-XoVmSnapshotAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-snapshots/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVmSnapshotAlarm is not implemented yet.")
    }
}
