# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-templates/{id}/alarms

function Get-XoVmTemplateAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VM template.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VM template.
    .EXAMPLE
        Get-XoVmTemplateAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-templates/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVmTemplateAlarm is not implemented yet.")
    }
}
