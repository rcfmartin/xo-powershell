# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/stats
    #   /vms/{id}/stats/data_source/{data_source}

function Get-XoVmStat
{
    <#
    .SYNOPSIS
        Get statistics for a VM.
    .DESCRIPTION
        Retrieve performance statistics for a VM, optionally scoped to a single data source.
    .EXAMPLE
        Get-XoVmStat
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/stats"
        $uri = "$script:XoHost/rest/v0/vms/{id}/stats/data_source/{data_source}"

        throw [System.NotImplementedException]::new("Get-XoVmStat is not implemented yet.")
    }
}
