# SPDX-License-Identifier: Apache-2.0

function Get-XoVmTemplateMessage
{
    <#
    .SYNOPSIS
        List messages for a VmTemplate.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VmTemplate.
    .PARAMETER VmTemplateUuid
        The UUID of the VmTemplate whose messages to retrieve.
    .EXAMPLE
        Get-XoVmTemplateMessage -VmTemplateUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Message")]
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
        $params["fields"] = $script:XO_MESSAGE_FIELDS
    }

    process
    {
        foreach ($id in $VmTemplateUuid)
        {
            $uri = "$script:XoHost/rest/v0/vm-templates/$id/messages"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoMessageObject
        }
    }
}
