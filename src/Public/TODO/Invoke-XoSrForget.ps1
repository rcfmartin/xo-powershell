# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/actions/forget

function Invoke-XoSrForget
{
    <#
    .SYNOPSIS
        Forget a storage repository.
    .DESCRIPTION
        Forget a storage repository without destroying the underlying data.
    .EXAMPLE
        Invoke-XoSrForget
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/actions/forget"

        throw [System.NotImplementedException]::new("Invoke-XoSrForget is not implemented yet.")
    }
}
