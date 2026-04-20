# SPDX-License-Identifier: Apache-2.0

function Get-XoPoolMessage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string]$PoolUuid
    )

    (Invoke-RestMethod -Uri "$script:XoHost/rest/v0/pools/$PoolUuid/messages" @script:XoRestParameters -Body $params) | ConvertFrom-XoUuidHref | ForEach-Object {
        Get-XoMessage $_
    }
}
