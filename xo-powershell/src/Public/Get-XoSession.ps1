# SPDX-License-Identifier: Apache-2.0

function Get-XoSession {
    <#
    .SYNOPSIS
        Get the current XO session settings.
    .DESCRIPTION
        Get the current XO session settings.
    #>
    [CmdletBinding()]
    param()

    [pscustomobject]@{
        Limit = $script:XoSessionLimit
    }
}
