# SPDX-License-Identifier: Apache-2.0

function Get-XoVmControllerMessage
{
    <#
    .SYNOPSIS
        List messages for a VmController.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra VmController.
    .PARAMETER VmControllerUuid
        The UUID of the VmController whose messages to retrieve.
    .EXAMPLE
        Get-XoVmControllerMessage -VmControllerUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Message")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VmControllerUuid
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $params = @{}
        $params["fields"] = $script:XO_MESSAGE_FIELDS
    }

    process
    {
        foreach ($id in $VmControllerUuid)
        {
            $uri = "$script:XoHost/rest/v0/vm-controllers/$id/messages"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoMessageObject
        }
    }
}
