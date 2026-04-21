# SPDX-License-Identifier: Apache-2.0

function Get-XoVmSnapshotVdi
{
    <#
    .SYNOPSIS
        List vdis for a VmSnapshot.
    .DESCRIPTION
        Retrieve vdis associated with a specific Xen Orchestra VmSnapshot.
    .PARAMETER VmSnapshotUuid
        The UUID of the VmSnapshot whose vdis to retrieve.
    .EXAMPLE
        Get-XoVmSnapshotVdi -VmSnapshotUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Vdi")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VmSnapshotUuid
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
        foreach ($id in $VmSnapshotUuid)
        {
            $uri = "$script:XoHost/rest/v0/vm-snapshots/$id/vdis"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoVdiObject
        }
    }
}
