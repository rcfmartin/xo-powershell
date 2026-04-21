# SPDX-License-Identifier: Apache-2.0

function Get-XoUserGroup
{
    <#
    .SYNOPSIS
        List groups for a User.
    .DESCRIPTION
        Retrieve groups associated with a specific Xen Orchestra User.
    .PARAMETER UserId
        The UUID of the User whose groups to retrieve.
    .EXAMPLE
        Get-XoUserGroup -UserId "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Group")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$UserId
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $params = @{}
        $params["fields"] = $script:XO_GROUP_FIELDS
    }

    process
    {
        foreach ($id in $UserId)
        {
            $uri = "$script:XoHost/rest/v0/users/$id/groups"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoGroupObject
        }
    }
}
