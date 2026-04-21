# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/tags/{tag}

function Set-XoSrTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on an SR.
    .DESCRIPTION
        Attach or detach a single tag from a specific storage repository.
    .EXAMPLE
        Set-XoSrTag
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/tags/{tag}"

        throw [System.NotImplementedException]::new("Set-XoSrTag is not implemented yet.")
    }
}
