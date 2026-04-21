# SPDX-License-Identifier: Apache-2.0

function Invoke-XoHostManagementReconfigure
{
    <#
    .SYNOPSIS
        Reconfigure the management network on a host.
    .DESCRIPTION
        Reconfigure the management network of the specified host. Provide the new address via -Parameters.
    .PARAMETER HostUuid
        The UUID of the host to act on.
    .PARAMETER Parameters
        Hashtable of parameters to pass in the action body. See the Xen Orchestra REST API docs for required fields.
    .EXAMPLE
        Invoke-XoHostManagementReconfigure -HostUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "High")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string]$HostUuid,

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
        if ($PSCmdlet.ShouldProcess($HostUuid, "reconfigure management"))
        {
            $uri = "$script:XoHost/rest/v0/hosts/$HostUuid/actions/management_reconfigure"
            $body = if ($Parameters) { [System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json $Parameters -Depth 99)) } else { [byte[]]@() }
            Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters -ContentType "application/json" -Body $body | ForEach-Object {
                ConvertFrom-XoTaskHref $_
            }
        }
    }
}
