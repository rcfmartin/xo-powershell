# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/messages

function Get-XoHostMessage
{
    <#
    .SYNOPSIS
        List messages for a host.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra host.
    .EXAMPLE
        Get-XoHostMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoHostMessage is not implemented yet.")
    }
}
