# SPDX-License-Identifier: Apache-2.0

function Move-XoVdi
{
    <#
    .SYNOPSIS
        Migrate a VDI to another SR.
    .DESCRIPTION
        Migrate the specified VDI to a different storage repository. Pass the destination SR via -Parameters.
    .PARAMETER VdiUuid
        The UUID of the vdi to act on.
    .PARAMETER Parameters
        Hashtable of parameters to pass in the action body. See the Xen Orchestra REST API docs for required fields.
    .EXAMPLE
        Move-XoVdi -VdiUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string]$VdiUuid,

        [Parameter()]
        [hashtable]$Parameters
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }
    }

    process
    {
        if ($PSCmdlet.ShouldProcess($VdiUuid, "migrate"))
        {
            $uri = "$script:XoHost/rest/v0/vdis/$VdiUuid/actions/migrate"
            $body = if ($Parameters) { [System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json $Parameters -Depth 99)) } else { [byte[]]@() }
            Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters -ContentType "application/json" -Body $body | ForEach-Object {
                ConvertFrom-XoTaskHref $_
            }
        }
    }
}
