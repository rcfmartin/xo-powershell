# SPDX-License-Identifier: Apache-2.0

function Get-XoSrVdi
{
    <#
    .SYNOPSIS
        Get virtual disks (VDIs) scoped to a specific storage repository.
    .DESCRIPTION
        Retrieves virtual disks (VDIs) attached to the specified Xen Orchestra storage repository. Accepts one or more storage repository UUIDs; each is queried independently and the combined results are returned.
    .PARAMETER SrUuid
        The UUID(s) of the storage repository whose virtual disks (VDIs) should be returned. Accepts pipeline input by property name.
    .EXAMPLE
        Get-XoSrVdi -SrUuid "00000000-0000-0000-0000-000000000000"
    .EXAMPLE
        Get-XoSr | Get-XoSrVdi
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

