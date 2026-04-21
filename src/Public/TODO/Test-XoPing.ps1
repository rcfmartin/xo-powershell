# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /ping

function Test-XoPing
{
    <#
    .SYNOPSIS
        Ping the Xen Orchestra API.
    .DESCRIPTION
        Test reachability of the Xen Orchestra REST API.
    .EXAMPLE
        Test-XoPing
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/ping"

        throw [System.NotImplementedException]::new("Test-XoPing is not implemented yet.")
    }
}
