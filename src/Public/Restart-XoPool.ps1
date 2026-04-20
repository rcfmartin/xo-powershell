# SPDX-License-Identifier: Apache-2.0

function Restart-XoPool {
    <#
    .SYNOPSIS
        Restart a running pool.
    .DESCRIPTION
        Restart the specified pools using a rolling pool reboot.
    .PARAMETER PoolUuid
        The UUID(s) of the pools(s) to restart.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "High")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string[]]$PoolUuid
    )

    process {
        foreach ($id in $PoolUuid) {
            if ($PSCmdlet.ShouldProcess($id, "Rolling pool reboot")) {
                Invoke-XoPoolAction -PoolUuid $id -Action "rolling_reboot"
            }
        }
    }
}
