# SPDX-License-Identifier: Apache-2.0

function Get-XoVbdAlarm
{
    <#
    .SYNOPSIS
        List alarms for a Vbd.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra Vbd.
    .PARAMETER VbdUuid
        The UUID of the Vbd whose alarms to retrieve.
    .EXAMPLE
        Get-XoVbdAlarm -VbdUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Alarm")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VbdUuid
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
        foreach ($id in $VbdUuid)
        {
            $uri = "$script:XoHost/rest/v0/vbds/$id/alarms"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoAlarmObject
        }
    }
}
