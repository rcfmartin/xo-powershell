# SPDX-License-Identifier: Apache-2.0

function Get-XoSingleVmById
{
    <#
    .SYNOPSIS
    Get a VM by ID

    .DESCRIPTION
    Get a single VM from Xen Orchestra by UUID.

    .PARAMETER VdiUuid
    Target VM UUID to retrieve.

    .PARAMETER Params
    Target VM request parameters hash.

    .EXAMPLE
    Get-XoSingleVmById -VdiUuid '812b59e1-2682-43ef-acd4-808d3551b907'
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Vm")]
    param (
        [string]$VmUuid
    )
    process
    {

        try
        {
            $uri = "$script:XoHost/rest/v0/vms/$VmUuid"
            $params = @{ fields = $script:XO_VM_FIELDS }
            $vmData = Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params

            if ($vmData)
            {
                return ConvertTo-XoVmObject -InputObject $vmData
            }
        }
        catch
        {
            throw ("Failed to retrieve VM with UUID {0}: {1}" -f $VmUuid, $_)
        }
        return $null
    }
}
