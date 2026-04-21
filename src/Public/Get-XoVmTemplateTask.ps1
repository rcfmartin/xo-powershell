# SPDX-License-Identifier: Apache-2.0

function Get-XoVmTemplateTask
{
    <#
    .SYNOPSIS
        List tasks for a VmTemplate.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VmTemplate.
    .PARAMETER VmTemplateUuid
        The UUID of the VmTemplate whose tasks to retrieve.
    .EXAMPLE
        Get-XoVmTemplateTask -VmTemplateUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VmTemplateUuid
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
        foreach ($id in $VmTemplateUuid)
        {
            $uri = "$script:XoHost/rest/v0/vm-templates/$id/tasks"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoTaskObject
        }
    }
}
