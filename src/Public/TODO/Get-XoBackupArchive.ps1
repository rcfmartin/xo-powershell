# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /backup-archives
    #   /backup-archives/{id}

function Get-XoBackupArchive
{
    <#
    .SYNOPSIS
        List or query backup archives.
    .DESCRIPTION
        Get Xen Orchestra backup archives by ID or list existing archives.
    .EXAMPLE
        Get-XoBackupArchive
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/backup-archives"
        $uri = "$script:XoHost/rest/v0/backup-archives/{id}"

        throw [System.NotImplementedException]::new("Get-XoBackupArchive is not implemented yet.")
    }
}
