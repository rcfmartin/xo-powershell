# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/logs.tgz

function Get-XoHostLogBundle
{
    <#
    .SYNOPSIS
        Download the host log bundle.
    .DESCRIPTION
        Download the compressed log bundle for a specific host.
    .EXAMPLE
        Get-XoHostLogBundle
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/logs.tgz"

        throw [System.NotImplementedException]::new("Get-XoHostLogBundle is not implemented yet.")
    }
}
