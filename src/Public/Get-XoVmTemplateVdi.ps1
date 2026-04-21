# SPDX-License-Identifier: Apache-2.0

function Get-XoVmTemplateVdi
{
    <#
    .SYNOPSIS
        List vdis for a VmTemplate.
    .DESCRIPTION
        Retrieve vdis associated with a specific Xen Orchestra VmTemplate.
    .PARAMETER VmTemplateUuid
        The UUID of the VmTemplate whose vdis to retrieve.
    .EXAMPLE
        Get-XoVmTemplateVdi -VmTemplateUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Vdi")]
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
        $params["fields"] = $script:XO_VDI_FIELDS
    }

    process
    {
        foreach ($id in $VmTemplateUuid)
        {
            $uri = "$script:XoHost/rest/v0/vm-templates/$id/vdis"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoVdiObject
        }
    }
}
