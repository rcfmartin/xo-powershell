# SPDX-License-Identifier: Apache-2.0

function Get-XoVdiSnapshotAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VdiSnapshot.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VdiSnapshot.
    .PARAMETER VdiSnapshotUuid
        The UUID of the VdiSnapshot whose alarms to retrieve.
    .EXAMPLE
        Get-XoVdiSnapshotAlarm -VdiSnapshotUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Alarm")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VdiSnapshotUuid
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
        foreach ($id in $VdiSnapshotUuid)
        {
            $uri = "$script:XoHost/rest/v0/vdi-snapshots/$id/alarms"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoAlarmObject
        }
    }
}
