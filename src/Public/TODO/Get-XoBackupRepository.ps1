# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /backup-repositories
    #   /backup-repositories/{id}

function Get-XoBackupRepository
{
    <#
    .SYNOPSIS
        List or query backup repositories.
    .DESCRIPTION
        Get Xen Orchestra backup repositories by ID or list existing repositories.
    .EXAMPLE
        Get-XoBackupRepository
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/backup-repositories"
        $uri = "$script:XoHost/rest/v0/backup-repositories/{id}"

        throw [System.NotImplementedException]::new("Get-XoBackupRepository is not implemented yet.")
    }
}
