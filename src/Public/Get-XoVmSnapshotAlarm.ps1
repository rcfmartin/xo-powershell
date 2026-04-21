# SPDX-License-Identifier: Apache-2.0

function Get-XoVmSnapshotAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VmSnapshot.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VmSnapshot.
    .PARAMETER VmSnapshotUuid
        The UUID of the VmSnapshot whose alarms to retrieve.
    .EXAMPLE
        Get-XoVmSnapshotAlarm -VmSnapshotUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Alarm")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VmSnapshotUuid
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $params = @{}
        $params["fields"] = $script:XO_ALARM_FIELDS
    }

    process
    {
        foreach ($id in $VmSnapshotUuid)
        {
            $uri = "$script:XoHost/rest/v0/vm-snapshots/$id/alarms"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoAlarmObject
        }
    }
}
