# SPDX-License-Identifier: Apache-2.0

function Get-XoSrVdi
{
    <#
    .SYNOPSIS
        List vdis for a Sr.
    .DESCRIPTION
        Retrieve vdis associated with a specific Xen Orchestra Sr.
    .PARAMETER SrUuid
        The UUID of the Sr whose vdis to retrieve.
    .EXAMPLE
        Get-XoSrVdi -SrUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Vdi")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$SrUuid
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
        foreach ($id in $SrUuid)
        {
            $uri = "$script:XoHost/rest/v0/srs/$id/vdis"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoVdiObject
        }
    }
}
