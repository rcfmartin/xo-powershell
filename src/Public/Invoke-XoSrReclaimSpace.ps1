# SPDX-License-Identifier: Apache-2.0

function Invoke-XoSrReclaimSpace
{
    <#
    .SYNOPSIS
        reclaim space one or more srs.
    .DESCRIPTION
        reclaim space the specified Xen Orchestra srs. Returns a task object that can be used to monitor the operation.
    .PARAMETER SrUuid
        The UUID(s) of the sr to act on.
    .EXAMPLE
        Invoke-XoSrReclaimSpace -SrUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string[]]$SrUuid
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
        foreach ($id in $SrUuid)
        {
            if ($PSCmdlet.ShouldProcess($id, "reclaim space"))
            {
                $uri = "$script:XoHost/rest/v0/srs/$id/actions/reclaim_space"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters | ForEach-Object {
                    ConvertFrom-XoTaskHref $_
                }
            }
        }
    }
}
