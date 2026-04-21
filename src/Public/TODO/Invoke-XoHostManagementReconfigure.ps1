# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/actions/management_reconfigure

function Invoke-XoHostManagementReconfigure
{
    <#
    .SYNOPSIS
        Reconfigure host management network.
    .DESCRIPTION
        Reconfigure the management network interface of a specific host.
    .EXAMPLE
        Invoke-XoHostManagementReconfigure
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/actions/management_reconfigure"

        throw [System.NotImplementedException]::new("Invoke-XoHostManagementReconfigure is not implemented yet.")
    }
}
