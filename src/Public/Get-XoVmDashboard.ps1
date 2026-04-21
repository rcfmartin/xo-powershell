# SPDX-License-Identifier: Apache-2.0

function Get-XoVmDashboard
{
    <#
    .SYNOPSIS
        List dashboard for a Vm.
    .DESCRIPTION
        Retrieve dashboard associated with a specific Xen Orchestra Vm.
    .PARAMETER VmUuid
        The UUID of the Vm whose dashboard to retrieve.
    .EXAMPLE
        Get-XoVmDashboard -VmUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Dashboard")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VmUuid
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $params = @{}

    }

    process
    {
        foreach ($id in $VmUuid)
        {
            $uri = "$script:XoHost/rest/v0/vms/$id/dashboard"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoDashboardObject
        }
    }
}
