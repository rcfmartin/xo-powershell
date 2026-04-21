# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/actions/reclaim_space

function Invoke-XoSrReclaimSpace
{
    <#
    .SYNOPSIS
        Reclaim space on a storage repository.
    .DESCRIPTION
        Trigger space reclamation on the specified storage repository.
    .EXAMPLE
        Invoke-XoSrReclaimSpace
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/actions/reclaim_space"

        throw [System.NotImplementedException]::new("Invoke-XoSrReclaimSpace is not implemented yet.")
    }
}
