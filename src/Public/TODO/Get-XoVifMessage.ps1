# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vifs/{id}/messages

function Get-XoVifMessage
{
    <#
    .SYNOPSIS
        List messages for a VIF.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VIF.
    .EXAMPLE
        Get-XoVifMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vifs/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoVifMessage is not implemented yet.")
    }
}
