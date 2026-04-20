# SPDX-License-Identifier: Apache-2.0

$script:XO_MESSAGE_FIELDS = "body,name,time,type,uuid"

function ConvertTo-XoMessageObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            MessageUuid = $InputObject.uuid
            MessageTime = [System.DateTimeOffset]::FromUnixTimeSeconds($InputObject.time).ToLocalTime()
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Message -Properties $props
    }
}
