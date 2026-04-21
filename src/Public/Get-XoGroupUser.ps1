# SPDX-License-Identifier: Apache-2.0

function Get-XoGroupUser
{
    <#
    .SYNOPSIS
        List users for a Group.
    .DESCRIPTION
        Retrieve users associated with a specific Xen Orchestra Group.
    .PARAMETER GroupId
        The UUID of the Group whose users to retrieve.
    .EXAMPLE
        Get-XoGroupUser -GroupId "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.User")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$GroupId
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
        foreach ($id in $GroupId)
        {
            $uri = "$script:XoHost/rest/v0/groups/$id/users"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoUserObject
        }
    }
}
