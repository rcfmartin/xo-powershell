# SPDX-License-Identifier: Apache-2.0

# For convenience. Internal use only.
function Invoke-XoPoolAction
{
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER PoolUuid
    Parameter description

    .PARAMETER Action
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string[]]$PoolUuid,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ArgumentCompleter()]
        [string]$Action
    )

    process
    {
        foreach ($id in $PoolUuid)
        {
            Invoke-RestMethod -Uri "$script:XoHost/rest/v0/pools/$PoolUuid/actions/$Action" -Method Post @script:XoRestParameters | ForEach-Object {
                ConvertFrom-XoTaskHref $_
            }
        }
    }
}
