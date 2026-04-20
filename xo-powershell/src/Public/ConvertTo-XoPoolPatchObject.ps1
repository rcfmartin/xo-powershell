# SPDX-License-Identifier: Apache-2.0

function ConvertTo-XoPoolPatchObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            Date        = [System.DateTimeOffset]::FromUnixTimeSeconds($InputObject.changelog.date).ToLocalTime()
            Description = $InputObject.changelog.description
        }
        Set-XoObject $InputObject -TypeName XoPowershell.PoolPatch -Properties $props
    }
}
