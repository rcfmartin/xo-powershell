# SPDX-License-Identifier: Apache-2.0

function Disconnect-XoVbd
{
    <#
    .SYNOPSIS
        disconnect one or more vbds.
    .DESCRIPTION
        disconnect the specified Xen Orchestra vbds. Returns a task object that can be used to monitor the operation.
    .PARAMETER VbdUuid
        The UUID(s) of the vbd to act on.
    .EXAMPLE
        Disconnect-XoVbd -VbdUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string[]]$VbdUuid
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
        foreach ($id in $VbdUuid)
        {
            if ($PSCmdlet.ShouldProcess($id, "disconnect"))
            {
                $uri = "$script:XoHost/rest/v0/vbds/$id/actions/disconnect"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters | ForEach-Object {
                    ConvertFrom-XoTaskHref $_
                }
            }
        }
    }
}
