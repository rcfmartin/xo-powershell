# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /events/{id}/subscriptions
    #   /events/{id}/subscriptions/{subscriptionId}

function Get-XoEventSubscription
{
    <#
    .SYNOPSIS
        List or query event subscriptions.
    .DESCRIPTION
        Get subscriptions for a specific Xen Orchestra event by subscription ID or list them.
    .EXAMPLE
        Get-XoEventSubscription
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/events/{id}/subscriptions"
        $uri = "$script:XoHost/rest/v0/events/{id}/subscriptions/{subscriptionId}"

        throw [System.NotImplementedException]::new("Get-XoEventSubscription is not implemented yet.")
    }
}
