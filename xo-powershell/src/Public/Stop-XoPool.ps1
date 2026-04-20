# SPDX-License-Identifier: Apache-2.0

function Stop-XoPool {
    <#
    .SYNOPSIS
        Stop a running pool.
    .DESCRIPTION
        Stop the specified pools. Currently only supports emergency shutdown.
    .PARAMETER PoolUuid
        The UUID(s) of the pools(s) to stop.
    .PARAMETER Force
        Perform an emergency shutdown.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "High")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string[]]$PoolUuid,

        [Parameter(Mandatory)]
        [switch]$Force
    )

    process {
        # Note: "Stop" is quite different from "emergency shutdown", thus the "-Force" parameter being mandatory for now.

        foreach ($id in $PoolUuid) {
            if ($PSCmdlet.ShouldProcess($id, "Emergency shutdown")) {
                Invoke-XoPoolAction -PoolUuid $id -Action "emergency_shutdown"
            }
        }
    }
}
