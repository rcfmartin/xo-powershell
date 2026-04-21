# SPDX-License-Identifier: Apache-2.0

function Get-XoGroupTask
{
    <#
    .SYNOPSIS
        List tasks for a Group.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra Group.
    .PARAMETER GroupId
        The UUID of the Group whose tasks to retrieve.
    .EXAMPLE
        Get-XoGroupTask -GroupId "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Task")]
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
        $params["fields"] = $script:XO_TASK_FIELDS
    }

    process
    {
        foreach ($id in $GroupId)
        {
            $uri = "$script:XoHost/rest/v0/groups/$id/tasks"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoTaskObject
        }
    }
}
