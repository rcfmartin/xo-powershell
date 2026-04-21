# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-controllers
    #   /vm-controllers/{id}

function Get-XoVmController
{
    <#
    .SYNOPSIS
        List or query VM controllers.
    .DESCRIPTION
        Get Xen Orchestra VM controllers by UUID or list existing controllers.
    .EXAMPLE
        Get-XoVmController
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-controllers"
        $uri = "$script:XoHost/rest/v0/vm-controllers/{id}"

        throw [System.NotImplementedException]::new("Get-XoVmController is not implemented yet.")
    }
}
