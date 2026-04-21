# SPDX-License-Identifier: Apache-2.0

function Get-XoBackupRepository
{
    <#
    .SYNOPSIS
        List or query backup-repositories.
    .DESCRIPTION
        Get Xen Orchestra backup-repositories by ID or list existing entries.
    .PARAMETER BackupRepositoryId
        The ID(s) of the BackupRepository to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoBackupRepository
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.BackupRepository")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "BackupRepositoryId")]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$BackupRepositoryId,

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
        $params["fields"] = $script:XO_BACKUP_REPOSITORY_FIELDS
    }

    process
    {
        if ($PSCmdlet.ParameterSetName -eq "BackupRepositoryId")
        {
            foreach ($id in $BackupRepositoryId)
            {
                $uri = "$script:XoHost/rest/v0/backup-repositories/$id"
                ConvertTo-XoBackupRepositoryObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter) { $params["filter"] = $Filter }
            if ($Limit)  { $params["limit"] = $Limit }

            $uri = "$script:XoHost/rest/v0/backup-repositories"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoBackupRepositoryObject
        }
    }
}
