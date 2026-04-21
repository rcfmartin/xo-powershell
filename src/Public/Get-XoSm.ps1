# SPDX-License-Identifier: Apache-2.0

function Get-XoSm
{
    <#
    .SYNOPSIS
        List or query sms.
    .DESCRIPTION
        Get Xen Orchestra sms by ID or list existing entries.
    .PARAMETER SmUuid
        The ID(s) of the Sm to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoSm -SmUuid '812b59e1-2682-43ef-acd4-808d3551b907'
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.Sm")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "SmUuid")]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$SmUuid,

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
        $params["fields"] = $script:XO_SM_FIELDS
    }

    process
    {
        if ($PSCmdlet.ParameterSetName -eq "SmUuid")
        {
            foreach ($id in $SmUuid)
            {
                $uri = "$script:XoHost/rest/v0/sms/$id"
                ConvertTo-XoSmObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter)
            {
                $params["filter"] = $Filter
            }
            if ($Limit)
            {
                $params["limit"] = $Limit
            }

            $uri = "$script:XoHost/rest/v0/sms"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoSmObject
        }
    }
}
