# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-controllers/{id}/messages

function Get-XoVmControllerMessage
{
    <#
    .SYNOPSIS
        List messages for a VM controller.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VM controller.
    .EXAMPLE
        Get-XoVmControllerMessage
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-controllers/{id}/messages"

        throw [System.NotImplementedException]::new("Get-XoVmControllerMessage is not implemented yet.")
    }
}
