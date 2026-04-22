# SPDX-License-Identifier: Apache-2.0

function Get-XoEventSubscription
{
    <#
    .SYNOPSIS
        List or query subscriptions for a specific Xen Orchestra event.
    .DESCRIPTION
        Retrieves webhook/API subscriptions attached to a given event. A subscription describes where and how Xen Orchestra should notify an external endpoint when the event fires. Supply -SubscriptionId to fetch a single subscription.
    .PARAMETER EventId
        The ID of the event whose subscriptions to retrieve.
    .PARAMETER SubscriptionId
        Optional ID of a specific subscription to retrieve instead of listing them all.
    .EXAMPLE
        Get-XoEventSubscription -EventId 'vm-started'
    .EXAMPLE
        Get-XoEventSubscription -EventId 'vm-started' -SubscriptionId 'sub-123'
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

