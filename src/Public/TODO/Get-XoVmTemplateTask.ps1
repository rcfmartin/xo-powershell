# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-templates/{id}/tasks

function Get-XoVmTemplateTask
{
    <#
    .SYNOPSIS
        List tasks for a VM template.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VM template.
    .EXAMPLE
        Get-XoVmTemplateTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-templates/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVmTemplateTask is not implemented yet.")
    }
}
