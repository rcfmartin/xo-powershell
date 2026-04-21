# SPDX-License-Identifier: Apache-2.0

function Get-XoVmBackupJob
{
    <#
    .SYNOPSIS
        List backup-jobs for a Vm.
    .DESCRIPTION
        Retrieve backup-jobs associated with a specific Xen Orchestra Vm.
    .PARAMETER VmUuid
        The UUID of the Vm whose backup-jobs to retrieve.
    .EXAMPLE
        Get-XoVmBackupJob -VmUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.BackupJob")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VmUuid
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $params = @{}
        $params["fields"] = $script:XO_BACKUP_JOB_FIELDS
    }

    process
    {
        foreach ($id in $VmUuid)
        {
            $uri = "$script:XoHost/rest/v0/vms/$id/backup-jobs"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoBackupJobObject
        }
    }
}
