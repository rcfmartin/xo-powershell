# SPDX-License-Identifier: Apache-2.0

function ConvertFrom-XoUuidHref
{
    <#
    .SYNOPSIS
    Convert Href to URI

    .DESCRIPTION
    Convert Href to URI

    .PARAMETER Uri
    Target uri

    .EXAMPLE
    ConvertFrom-XoUuidHref -Uri $uri
    #>
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)][string]$Uri
    )

    process
    {
        if ($Uri -notmatch "\/rest\/v0\/[0-9a-z-_]+\/[0-9a-z-]+")
        {
            throw "Bad href format"
        }
        [uri]::new([uri]$script:XoHost, $Uri).Segments[-1]
    }
}
