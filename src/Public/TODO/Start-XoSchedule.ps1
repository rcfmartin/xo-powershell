# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /schedules/{id}/actions/run

function Start-XoSchedule
{
    <#
    .SYNOPSIS
        Run a schedule.
    .DESCRIPTION
        Swagger-canonical variant using /schedules/{id}/actions/run. Existing Public\Start-XoSchedule hits /schedules/{id}/run - update once verified.
    .EXAMPLE
        Start-XoSchedule
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/schedules/{id}/actions/run"

        throw [System.NotImplementedException]::new("Start-XoSchedule is not implemented yet.")
    }
}
