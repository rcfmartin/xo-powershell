# SPDX-License-Identifier: Apache-2.0

function Get-XoEventSubscription
{
    <#
    .SYNOPSIS
        List or query event subscriptions.
    .DESCRIPTION
        Retrieve subscriptions registered for a specific Xen Orchestra event.
    .PARAMETER EventId
        The ID of the event whose subscriptions to retrieve.
    .PARAMETER SubscriptionId
        The ID of a specific subscription to retrieve.
    .EXAMPLE
        Get-XoEventSubscription -EventId "event-id"
    #>
    [CmdletBinding(DefaultParameterSetName = "All")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [string]$EventId,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = "Single")]
        [string]$SubscriptionId
    )

    process
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        if ($SubscriptionId)
        {
            $uri = "$script:XoHost/rest/v0/events/$EventId/subscriptions/$SubscriptionId"
        }
        else
        {
            $uri = "$script:XoHost/rest/v0/events/$EventId/subscriptions"
        }

        Invoke-RestMethod -Uri $uri @script:XoRestParameters
    }
}
