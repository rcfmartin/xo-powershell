# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdis/{id}/actions/migrate

function Move-XoVdi
{
    <#
    .SYNOPSIS
        Migrate a VDI to another SR.
    .DESCRIPTION
        Migrate the specified VDI to a different storage repository.
    .EXAMPLE
        Move-XoVdi
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdis/{id}/actions/migrate"

        throw [System.NotImplementedException]::new("Move-XoVdi is not implemented yet.")
    }
}
