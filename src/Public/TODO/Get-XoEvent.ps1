# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /events

function Get-XoEvent
{
    <#
    .SYNOPSIS
        List events.
    .DESCRIPTION
        Retrieve Xen Orchestra events.
    .EXAMPLE
        Get-XoEvent
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/events"

        throw [System.NotImplementedException]::new("Get-XoEvent is not implemented yet.")
    }
}
