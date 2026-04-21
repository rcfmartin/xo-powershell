# SPDX-License-Identifier: Apache-2.0

function Disconnect-XoServer
{
    <#
    .SYNOPSIS
        disconnect one or more servers.
    .DESCRIPTION
        disconnect the specified Xen Orchestra servers. Returns a task object that can be used to monitor the operation.
    .PARAMETER ServerUuid
        The UUID(s) of the server to act on.
    .EXAMPLE
        Disconnect-XoServer -ServerUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    [OutputType("XoPowershell.Task")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string[]]$ServerUuid
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
        foreach ($id in $ServerUuid)
        {
            if ($PSCmdlet.ShouldProcess($id, "disconnect"))
            {
                $uri = "$script:XoHost/rest/v0/servers/$id/actions/disconnect"
                Invoke-RestMethod -Uri $uri -Method Post @script:XoRestParameters | ForEach-Object {
                    ConvertFrom-XoTaskHref $_
                }
            }
        }
    }
}
