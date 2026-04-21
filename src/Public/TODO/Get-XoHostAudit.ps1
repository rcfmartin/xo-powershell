# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/audit.txt

function Get-XoHostAudit
{
    <#
    .SYNOPSIS
        Download the host audit log.
    .DESCRIPTION
        Download the plain-text audit log for a specific host.
    .EXAMPLE
        Get-XoHostAudit
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/audit.txt"

        throw [System.NotImplementedException]::new("Get-XoHostAudit is not implemented yet.")
    }
}
