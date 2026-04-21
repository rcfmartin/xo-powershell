# SPDX-License-Identifier: Apache-2.0

function Get-XoVdiSnapshotTask
{
    <#
    .SYNOPSIS
        List tasks for a VdiSnapshot.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VdiSnapshot.
    .PARAMETER VdiSnapshotUuid
        The UUID of the VdiSnapshot whose tasks to retrieve.
    .EXAMPLE
        Get-XoVdiSnapshotTask -VdiSnapshotUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VdiSnapshotUuid
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
        foreach ($id in $VdiSnapshotUuid)
        {
            $uri = "$script:XoHost/rest/v0/vdi-snapshots/$id/tasks"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoTaskObject
        }
    }
}
