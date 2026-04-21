# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /sms
    #   /sms/{id}

function Get-XoSm
{
    <#
    .SYNOPSIS
        List or query storage managers.
    .DESCRIPTION
        Get Xen Orchestra storage managers by UUID or list existing storage managers.
    .EXAMPLE
        Get-XoSm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/sms"
        $uri = "$script:XoHost/rest/v0/sms/{id}"

        throw [System.NotImplementedException]::new("Get-XoSm is not implemented yet.")
    }
}
