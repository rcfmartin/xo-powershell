# SPDX-License-Identifier: Apache-2.0

function Get-XoBackupLog
{
    <#
    .SYNOPSIS
        List or query backup-logs.
    .DESCRIPTION
        Get Xen Orchestra backup-logs by ID or list existing entries.
    .PARAMETER BackupLogId
        The ID(s) of the BackupLog to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoBackupLog
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.BackupLog")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "BackupLogId")]
        [string[]]$BackupLogId,

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
        $params["fields"] = $script:XO_BACKUP_LOG_FIELDS
    }

    process
    {
        if ($PSCmdlet.ParameterSetName -eq "BackupLogId")
        {
            foreach ($id in $BackupLogId)
            {
                $uri = "$script:XoHost/rest/v0/backup-logs/$id"
                ConvertTo-XoBackupLogObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter) { $params["filter"] = $Filter }
            if ($Limit)  { $params["limit"] = $Limit }

            $uri = "$script:XoHost/rest/v0/backup-logs"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoBackupLogObject
        }
    }
}
