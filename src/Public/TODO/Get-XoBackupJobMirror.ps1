# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /backup/jobs/mirror
    #   /backup/jobs/mirror/{id}

function Get-XoBackupJobMirror
{
    <#
    .SYNOPSIS
        List or query mirror backup jobs.
    .DESCRIPTION
        Get Xen Orchestra mirror backup jobs by ID or list existing jobs.
    .EXAMPLE
        Get-XoBackupJobMirror
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/backup/jobs/mirror"
        $uri = "$script:XoHost/rest/v0/backup/jobs/mirror/{id}"

        throw [System.NotImplementedException]::new("Get-XoBackupJobMirror is not implemented yet.")
    }
}
