# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/messages

function Get-XoSrMessage
{
    <#
    .SYNOPSIS
        List messages for an SR.
    .DESCRIPTION
        Retrieve messages associated with a specific storage repository.
    .EXAMPLE
        Get-XoSrMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoSrMessage is not implemented yet.")
    }
}
