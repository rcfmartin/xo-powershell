# SPDX-License-Identifier: Apache-2.0

$script:XO_SCHEDULE_FIELDS = "cron,enabled,name,timezone,id,jobId"

function ConvertTo-XoScheduleObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            ScheduleId = $InputObject.id
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Schedule -Properties $props
    }
}
