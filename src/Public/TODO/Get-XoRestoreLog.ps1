# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /restore-logs
    #   /restore-logs/{id}

function Get-XoRestoreLog
{
    <#
    .SYNOPSIS
        List or query restore logs.
    .DESCRIPTION
        Get Xen Orchestra restore logs by ID or list existing restore logs.
    .EXAMPLE
        Get-XoRestoreLog
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/restore-logs"
        $uri = "$script:XoHost/rest/v0/restore-logs/{id}"

        throw [System.NotImplementedException]::new("Get-XoRestoreLog is not implemented yet.")
    }
}
