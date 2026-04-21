# SPDX-License-Identifier: Apache-2.0

function Get-XoNetworkTask
{
    <#
    .SYNOPSIS
        List tasks for a Network.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra Network.
    .PARAMETER NetworkUuid
        The UUID of the Network whose tasks to retrieve.
    .EXAMPLE
        Get-XoNetworkTask -NetworkUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$NetworkUuid
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
        foreach ($id in $NetworkUuid)
        {
            $uri = "$script:XoHost/rest/v0/networks/$id/tasks"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoTaskObject
        }
    }
}
