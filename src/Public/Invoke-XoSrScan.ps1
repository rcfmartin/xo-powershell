# SPDX-License-Identifier: Apache-2.0

function Invoke-XoSrScan
{
    <#
    .SYNOPSIS
        scan one or more srs.
    .DESCRIPTION
        scan the specified Xen Orchestra srs. Returns a task object that can be used to monitor the operation.
    .PARAMETER SrUuid
        The UUID(s) of the sr to act on.
    .EXAMPLE
        Invoke-XoSrScan -SrUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Low")]
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
            if ($PSCmdlet.ShouldProcess($id, "scan"))
            {
                $uri = "$script:XoHost/rest/v0/srs/$id/actions/scan"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters | ForEach-Object {
                    ConvertFrom-XoTaskHref $_
                }
            }
        }
    }
}
