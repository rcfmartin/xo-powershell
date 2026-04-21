# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /srs/{id}/alarms

function Get-XoSrAlarm
{
    <#
    .SYNOPSIS
        List alarms for an SR.
    .DESCRIPTION
        Retrieve alarms associated with a specific storage repository.
    .EXAMPLE
        Get-XoSrAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/srs/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoSrAlarm is not implemented yet.")
    }
}
