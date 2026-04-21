# SPDX-License-Identifier: Apache-2.0

function Move-XoVm
{
    <#
    .SYNOPSIS
        Migrate a VM to another host.
    .DESCRIPTION
        Migrate the specified VM to a different host. Pass the destination via -Parameters.
    .PARAMETER VmUuid
        The UUID of the vm to act on.
    .PARAMETER Parameters
        Hashtable of parameters to pass in the action body. See the Xen Orchestra REST API docs for required fields.
    .EXAMPLE
        Move-XoVm -VmUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string]$VmUuid,

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
        if ($PSCmdlet.ShouldProcess($VmUuid, "migrate"))
        {
            $uri = "$script:XoHost/rest/v0/vms/$VmUuid/actions/migrate"
            $body = if ($Parameters) { [System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json $Parameters -Depth 99)) } else { [byte[]]@() }
            Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters -ContentType "application/json" -Body $body | ForEach-Object {
                ConvertFrom-XoTaskHref $_
            }
        }
    }
}
