# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /backup/logs
    #   /backup/logs/{id}

function Get-XoBackupJobLog
{
    <#
    .SYNOPSIS
        List or query backup job logs.
    .DESCRIPTION
        Get Xen Orchestra backup job run logs by ID or list existing log entries.
    .EXAMPLE
        Get-XoBackupJobLog
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/backup/logs"
        $uri = "$script:XoHost/rest/v0/backup/logs/{id}"

        throw [System.NotImplementedException]::new("Get-XoBackupJobLog is not implemented yet.")
    }
}
