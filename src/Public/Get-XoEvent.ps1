# SPDX-License-Identifier: Apache-2.0

function Get-XoEvent
{
    <#
    .SYNOPSIS
        List events.
    .DESCRIPTION
        Retrieve Xen Orchestra events with optional filter and limit.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoEvent
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Event")]
    param (
        [Parameter()]
        [string]$Filter,

        [Parameter()]
        [int]$Limit = $script:XoSessionLimit
    )

    process
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $params = @{}
        $params["fields"] = $script:XO_EVENT_FIELDS
        if ($Filter)   { $params["filter"] = $Filter }
        if ($Limit)    { $params["limit"] = $Limit }

        $uri = "$script:XoHost/rest/v0/events"
        (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoEventObject
    }
}
