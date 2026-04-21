# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vbds/{id}/alarms

function Get-XoVbdAlarm
{
    <#
    .SYNOPSIS
        List alarms for a VBD.
    .DESCRIPTION
        Retrieve alarms associated with a specific Xen Orchestra VBD.
    .EXAMPLE
        Get-XoVbdAlarm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vbds/{id}/alarms"

        throw [System.NotImplementedException]::new("Get-XoVbdAlarm is not implemented yet.")
    }
}
