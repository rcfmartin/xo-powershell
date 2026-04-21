# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pgpus
    #   /pgpus/{id}

function Get-XoPgpu
{
    <#
    .SYNOPSIS
        List or query physical GPUs.
    .DESCRIPTION
        Get Xen Orchestra physical GPUs by UUID or list existing PGPUs.
    .EXAMPLE
        Get-XoPgpu
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pgpus"
        $uri = "$script:XoHost/rest/v0/pgpus/{id}"

        throw [System.NotImplementedException]::new("Get-XoPgpu is not implemented yet.")
    }
}
