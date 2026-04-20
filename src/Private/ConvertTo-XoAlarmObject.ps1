# SPDX-License-Identifier: Apache-2.0

$script:XO_ALARM_FIELDS = "body,name,time,type,uuid,`$pool"

function ConvertTo-XoAlarmObject
{
    <#
    .SYNOPSIS
    Convert object to Alarm Object

    .DESCRIPTION
    Convert object to Alarm Object

    .PARAMETER InputObject
    Target object

    .EXAMPLE
    ConvertTo-XoAlarmObject -InputObject $Object
    #>
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process
    {
        $props = @{
            AlarmTime = [System.DateTimeOffset]::FromUnixTimeSeconds($InputObject.time).ToLocalTime()
            BodyName  = $InputObject.body.name
            BodyValue = $InputObject.body.value
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Alarm -Properties $props
    }
}
