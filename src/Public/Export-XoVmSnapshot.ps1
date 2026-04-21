# SPDX-License-Identifier: Apache-2.0

function Export-XoVmSnapshot
{
    <#
    .SYNOPSIS
        Export a VmSnapshot in the specified format.
    .DESCRIPTION
        Export a VmSnapshot from Xen Orchestra. Downloads the content to a local file.
    .PARAMETER VmSnapshotUuid
        The UUID of the VmSnapshot to export.
    .PARAMETER Format
        The format to export the VmSnapshot in.
    .PARAMETER OutFile
        The path to save the exported content to.
    .PARAMETER PassThru
        Return the exported file as a FileInfo object.
    .EXAMPLE
        Export-XoVmSnapshot -VmSnapshotUuid "00000000-0000-0000-0000-000000000000" -Format xva -OutFile "./export.xva"
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string]$VmSnapshotUuid,

        [Parameter(Mandatory)]
        [ValidateSet("xva", "ova")]
        [string]$Format,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$OutFile,

        [Parameter()]
        [switch]$PassThru
    )

    process
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $resolvedPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutFile)

        if ($PSCmdlet.ShouldProcess($VmSnapshotUuid, "export to $resolvedPath in $Format format"))
        {
            try
            {
                $uri = "$script:XoHost/rest/v0/vm-snapshots/$VmSnapshotUuid.$Format"
                Invoke-RestMethod -Uri $uri @script:XoRestParameters -OutFile $resolvedPath

                if ($PassThru)
                {
                    Get-Item $resolvedPath
                }
            }
            catch
            {
                throw ("Failed to export VmSnapshot with UUID {0}: {1}" -f $VmSnapshotUuid, $_)
            }
        }
    }
}
