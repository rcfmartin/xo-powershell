# SPDX-License-Identifier: Apache-2.0

function Invoke-XoVmPause
{
    <#
    .SYNOPSIS
        pause one or more vms.
    .DESCRIPTION
        pause the specified Xen Orchestra vms. Returns a task object that can be used to monitor the operation.
    .PARAMETER VmUuid
        The UUID(s) of the vm to act on.
    .EXAMPLE
        Invoke-XoVmPause -VmUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string[]]$VmUuid
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
        foreach ($id in $VmUuid)
        {
            if ($PSCmdlet.ShouldProcess($id, "pause"))
            {
                $uri = "$script:XoHost/rest/v0/vms/$id/actions/pause"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters | ForEach-Object {
                    ConvertFrom-XoTaskHref $_
                }
            }
        }
    }
}
