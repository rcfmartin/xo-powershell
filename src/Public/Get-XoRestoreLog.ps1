# SPDX-License-Identifier: Apache-2.0

function Get-XoRestoreLog
{
    <#
    .SYNOPSIS
        List or query restore-logs.
    .DESCRIPTION
        Get Xen Orchestra restore-logs by ID or list existing entries.
    .PARAMETER RestoreLogId
        The ID(s) of the RestoreLog to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoRestoreLog
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.RestoreLog")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "RestoreLogId")]
        [string[]]$RestoreLogId,

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
        $params["fields"] = $script:XO_RESTORE_LOG_FIELDS
    }

    process
    {
        if ($PSCmdlet.ParameterSetName -eq "RestoreLogId")
        {
            foreach ($id in $RestoreLogId)
            {
                $uri = "$script:XoHost/rest/v0/restore-logs/$id"
                ConvertTo-XoRestoreLogObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter) { $params["filter"] = $Filter }
            if ($Limit)  { $params["limit"] = $Limit }

            $uri = "$script:XoHost/rest/v0/restore-logs"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoRestoreLogObject
        }
    }
}
