# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /backup/jobs/vm
    #   /backup/jobs/vm/{id}

function Get-XoBackupJobVm
{
    <#
    .SYNOPSIS
        List or query VM backup jobs.
    .DESCRIPTION
        Get Xen Orchestra VM backup jobs by ID or list existing jobs.
    .EXAMPLE
        Get-XoBackupJobVm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/backup/jobs/vm"
        $uri = "$script:XoHost/rest/v0/backup/jobs/vm/{id}"

        throw [System.NotImplementedException]::new("Get-XoBackupJobVm is not implemented yet.")
    }
}
