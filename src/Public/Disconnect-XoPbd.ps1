# SPDX-License-Identifier: Apache-2.0

function Disconnect-XoPbd
{
    <#
    .SYNOPSIS
        unplug one or more pbds.
    .DESCRIPTION
        unplug the specified Xen Orchestra pbds. Returns a task object that can be used to monitor the operation.
    .PARAMETER PbdUuid
        The UUID(s) of the pbd to act on.
    .EXAMPLE
        Disconnect-XoPbd -PbdUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string[]]$PbdUuid
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
        foreach ($id in $PbdUuid)
        {
            if ($PSCmdlet.ShouldProcess($id, "unplug"))
            {
                $uri = "$script:XoHost/rest/v0/pbds/$id/actions/unplug"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters | ForEach-Object {
                    ConvertFrom-XoTaskHref $_
                }
            }
        }
    }
}
