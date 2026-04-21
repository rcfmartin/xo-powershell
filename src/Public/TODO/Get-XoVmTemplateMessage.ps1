# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-templates/{id}/messages

function Get-XoVmTemplateMessage
{
    <#
    .SYNOPSIS
        List messages for a VM template.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VM template.
    .EXAMPLE
        Get-XoVmTemplateMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-templates/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoVmTemplateMessage is not implemented yet.")
    }
}
