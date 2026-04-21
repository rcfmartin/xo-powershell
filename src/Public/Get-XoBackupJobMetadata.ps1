# SPDX-License-Identifier: Apache-2.0

function Get-XoBackupJobMetadata
{
    <#
    .SYNOPSIS
        List or query backup/jobs/metadata.
    .DESCRIPTION
        Get Xen Orchestra backup/jobs/metadata by ID or list existing entries.
    .PARAMETER BackupJobId
        The ID(s) of the BackupJob to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoBackupJobMetadata
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.BackupJob")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "BackupJobId")]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$BackupJobId,

        [Parameter(ParameterSetName = "Filter")]
        [string]$Filter,

        [Parameter(ParameterSetName = "Filter")]
        [int]$Limit = $script:XoSessionLimit
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
        if ($PSCmdlet.ParameterSetName -eq "BackupJobId")
        {
            foreach ($id in $BackupJobId)
            {
                $uri = "$script:XoHost/rest/v0/backup/jobs/metadata/$id"
                ConvertTo-XoBackupJobObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter) { $params["filter"] = $Filter }
            if ($Limit)  { $params["limit"] = $Limit }

            $uri = "$script:XoHost/rest/v0/backup/jobs/metadata"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoBackupJobObject
        }
    }
}
