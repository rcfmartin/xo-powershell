# SPDX-License-Identifier: Apache-2.0

function Stop-XoTask
{
    <#
    .SYNOPSIS
        Abort a running task.
    .DESCRIPTION
        Abort the specified Xen Orchestra task(s).
    .PARAMETER TaskId
        The ID(s) of the task(s) to abort.
    .EXAMPLE
        Stop-XoTask -TaskId "0m8k2zkzi"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string[]]$TaskId
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
        foreach ($id in $TaskId)
        {
            if ($PSCmdlet.ShouldProcess($id, "abort"))
            {
                $uri = "$script:XoHost/rest/v0/tasks/$id/actions/abort"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters
            }
        }
    }
}
