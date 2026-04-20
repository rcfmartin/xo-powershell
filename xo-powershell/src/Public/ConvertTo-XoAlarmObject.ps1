# SPDX-License-Identifier: Apache-2.0

$script:XO_ALARM_FIELDS = "body,name,time,type,uuid,`$pool"

function ConvertTo-XoAlarmObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            AlarmTime = [System.DateTimeOffset]::FromUnixTimeSeconds($InputObject.time).ToLocalTime()
            BodyName  = $InputObject.body.name
            BodyValue = $InputObject.body.value
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Alarm -Properties $props
    }
}
