# SPDX-License-Identifier: Apache-2.0

function Disable-XoHost
{
    <#
    .SYNOPSIS
        disable one or more hosts.
    .DESCRIPTION
        disable the specified Xen Orchestra hosts. Returns a task object that can be used to monitor the operation.
    .PARAMETER HostUuid
        The UUID(s) of the host to act on.
    .EXAMPLE
        Disable-XoHost -HostUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string[]]$HostUuid
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
        foreach ($id in $HostUuid)
        {
            if ($PSCmdlet.ShouldProcess($id, "disable"))
            {
                $uri = "$script:XoHost/rest/v0/hosts/$id/actions/disable"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters | ForEach-Object {
                    ConvertFrom-XoTaskHref $_
                }
            }
        }
    }
}
