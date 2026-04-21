# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /backup-logs
    #   /backup-logs/{id}

function Get-XoBackupLog
{
    <#
    .SYNOPSIS
        List or query backup logs.
    .DESCRIPTION
        Get Xen Orchestra backup logs by ID or list existing backup logs.
    .EXAMPLE
        Get-XoBackupLog
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/backup-logs"
        $uri = "$script:XoHost/rest/v0/backup-logs/{id}"

        throw [System.NotImplementedException]::new("Get-XoBackupLog is not implemented yet.")
    }
}
