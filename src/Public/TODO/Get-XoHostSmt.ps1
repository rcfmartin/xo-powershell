# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/smt

function Get-XoHostSmt
{
    <#
    .SYNOPSIS
        Get SMT status for a host.
    .DESCRIPTION
        Retrieve the SMT (hyperthreading) status for a specific host.
    .EXAMPLE
        Get-XoHostSmt
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/smt"

        throw [System.NotImplementedException]::new("Get-XoHostSmt is not implemented yet.")
    }
}
