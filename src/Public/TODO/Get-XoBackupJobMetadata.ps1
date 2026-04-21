# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /backup/jobs/metadata
    #   /backup/jobs/metadata/{id}

function Get-XoBackupJobMetadata
{
    <#
    .SYNOPSIS
        List or query metadata backup jobs.
    .DESCRIPTION
        Get Xen Orchestra metadata backup jobs by ID or list existing jobs.
    .EXAMPLE
        Get-XoBackupJobMetadata
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/backup/jobs/metadata"
        $uri = "$script:XoHost/rest/v0/backup/jobs/metadata/{id}"

        throw [System.NotImplementedException]::new("Get-XoBackupJobMetadata is not implemented yet.")
    }
}
