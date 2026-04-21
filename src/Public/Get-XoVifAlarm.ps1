# SPDX-License-Identifier: Apache-2.0

function Get-XoVifAlarm
{
    <#
    .SYNOPSIS
        List alarms for a Vif.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra Vif.
    .PARAMETER VifUuid
        The UUID of the Vif whose alarms to retrieve.
    .EXAMPLE
        Get-XoVifAlarm -VifUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Alarm")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VifUuid
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
        foreach ($id in $VifUuid)
        {
            $uri = "$script:XoHost/rest/v0/vifs/$id/alarms"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoAlarmObject
        }
    }
}
