# SPDX-License-Identifier: Apache-2.0

function Get-XoBackupArchive
{
    <#
    .SYNOPSIS
        List or query backup-archives.
    .DESCRIPTION
        Get Xen Orchestra backup-archives by ID or list existing entries.
    .PARAMETER BackupArchiveId
        The ID(s) of the BackupArchive to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoBackupArchive
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.BackupArchive")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "BackupArchiveId")]
        [string[]]$BackupArchiveId,

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
        $params["fields"] = $script:XO_BACKUP_ARCHIVE_FIELDS
    }

    process
    {
        if ($PSCmdlet.ParameterSetName -eq "BackupArchiveId")
        {
            foreach ($id in $BackupArchiveId)
            {
                $uri = "$script:XoHost/rest/v0/backup-archives/$id"
                ConvertTo-XoBackupArchiveObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter) { $params["filter"] = $Filter }
            if ($Limit)  { $params["limit"] = $Limit }

            $uri = "$script:XoHost/rest/v0/backup-archives"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoBackupArchiveObject
        }
    }
}
