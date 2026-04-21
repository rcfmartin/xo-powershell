# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pifs/{id}/messages

function Get-XoPifMessage
{
    <#
    .SYNOPSIS
        List messages for a PIF.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra PIF.
    .EXAMPLE
        Get-XoPifMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pifs/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoPifMessage is not implemented yet.")
    }
}
