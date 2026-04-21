# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/actions/scan

function Invoke-XoSrScan
{
    <#
    .SYNOPSIS
        Rescan a storage repository.
    .DESCRIPTION
        Trigger a rescan of the specified storage repository.
    .EXAMPLE
        Invoke-XoSrScan
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/actions/scan"

        throw [System.NotImplementedException]::new("Invoke-XoSrScan is not implemented yet.")
    }
}
