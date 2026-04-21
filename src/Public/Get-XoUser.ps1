# SPDX-License-Identifier: Apache-2.0

function Get-XoUser
{
    <#
    .SYNOPSIS
        List or query users.
    .DESCRIPTION
        Get Xen Orchestra users by ID or list existing entries.
    .PARAMETER UserId
        The ID(s) of the User to retrieve.
    .PARAMETER Filter
        Custom filter expression for the query.
    .PARAMETER Limit
        Maximum number of results to return.
    .EXAMPLE
        Get-XoUser
    #>
    [CmdletBinding(DefaultParameterSetName = "Filter")]
    [OutputType("XoPowershell.User")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0, ParameterSetName = "UserId")]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$UserId,

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
        $params["fields"] = $script:XO_USER_FIELDS
    }

    process
    {
        if ($PSCmdlet.ParameterSetName -eq "UserId")
        {
            foreach ($id in $UserId)
            {
                $uri = "$script:XoHost/rest/v0/users/$id"
                ConvertTo-XoUserObject (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params)
            }
        }
    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq "Filter")
        {
            if ($Filter) { $params["filter"] = $Filter }
            if ($Limit)  { $params["limit"] = $Limit }

            $uri = "$script:XoHost/rest/v0/users"
            # the parentheses forces the resulting array to unpack, don't remove them!
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoUserObject
        }
    }
}
