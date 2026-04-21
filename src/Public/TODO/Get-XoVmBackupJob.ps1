# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/backup-jobs

function Get-XoVmBackupJob
{
    <#
    .SYNOPSIS
        List backup jobs for a VM.
    .DESCRIPTION
        Retrieve backup jobs that include a specific Xen Orchestra VM.
    .EXAMPLE
        Get-XoVmBackupJob
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/backup-jobs"

        throw [System.NotImplementedException]::new("Get-XoVmBackupJob is not implemented yet.")
    }
}
