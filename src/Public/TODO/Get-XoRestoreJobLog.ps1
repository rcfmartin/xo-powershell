# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /restore/logs
    #   /restore/logs/{id}

function Get-XoRestoreJobLog
{
    <#
    .SYNOPSIS
        List or query restore job logs.
    .DESCRIPTION
        Get Xen Orchestra restore job run logs by ID or list existing log entries.
    .EXAMPLE
        Get-XoRestoreJobLog
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/restore/logs"
        $uri = "$script:XoHost/rest/v0/restore/logs/{id}"

        throw [System.NotImplementedException]::new("Get-XoRestoreJobLog is not implemented yet.")
    }
}
