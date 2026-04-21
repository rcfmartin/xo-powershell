# SPDX-License-Identifier: Apache-2.0

function Export-XoVm
{
    <#
    .SYNOPSIS
        Export a Vm in the specified format.
    .DESCRIPTION
        Export a Vm from Xen Orchestra. Downloads the content to a local file.
    .PARAMETER VmUuid
        The UUID of the Vm to export.
    .PARAMETER Format
        The format to export the Vm in.
    .PARAMETER OutFile
        The path to save the exported content to.
    .PARAMETER PassThru
        Return the exported file as a FileInfo object.
    .EXAMPLE
        Export-XoVm -VmUuid "00000000-0000-0000-0000-000000000000" -Format xva -OutFile "./export.xva"
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string]$VmUuid,

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

        if ($PSCmdlet.ShouldProcess($VmUuid, "export to $resolvedPath in $Format format"))
        {
            try
            {
                $uri = "$script:XoHost/rest/v0/vms/$VmUuid.$Format"
                Invoke-RestMethod -Uri $uri @script:XoRestParameters -OutFile $resolvedPath

                if ($PassThru)
                {
                    Get-Item $resolvedPath
                }
            }
            catch
            {
                throw ("Failed to export Vm with UUID {0}: {1}" -f $VmUuid, $_)
            }
        }
    }
}
