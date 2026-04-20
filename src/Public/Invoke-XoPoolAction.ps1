# SPDX-License-Identifier: Apache-2.0

# For convenience. Internal use only.
function Invoke-XoPoolAction {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string[]]$PoolUuid,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Action
    )

    process {
        foreach ($id in $PoolUuid) {
            Invoke-RestMethod -Uri "$script:XoHost/rest/v0/pools/$PoolUuid/actions/$Action" -Method Post @script:XoRestParameters | ForEach-Object {
                ConvertFrom-XoTaskHref $_
            }
        }
    }
}
