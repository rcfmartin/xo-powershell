# SPDX-License-Identifier: Apache-2.0

function Get-XoPbd
{
    <#
    .SYNOPSIS
        List or query pbds.
    .DESCRIPTION
        Get Xen Orchestra pbds by ID or list existing entries.
    .PARAMETER PbdUuid
        The ID(s) of the Pbd to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoPbd
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.Pbd")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "PbdUuid")]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$PbdUuid,

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
        $params["fields"] = $script:XO_PBD_FIELDS
    }

    process
    {
        if ($PSCmdlet.ParameterSetName -eq "PbdUuid")
        {
            foreach ($id in $PbdUuid)
            {
                $uri = "$script:XoHost/rest/v0/pbds/$id"
                ConvertTo-XoPbdObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter) { $params["filter"] = $Filter }
            if ($Limit)  { $params["limit"] = $Limit }

            $uri = "$script:XoHost/rest/v0/pbds"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoPbdObject
        }
    }
}
