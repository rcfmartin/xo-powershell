# SPDX-License-Identifier: Apache-2.0

function Get-XoVbdMessage
{
    <#
    .SYNOPSIS
        List messages for a Vbd.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra Vbd.
    .PARAMETER VbdUuid
        The UUID of the Vbd whose messages to retrieve.
    .EXAMPLE
        Get-XoVbdMessage -VbdUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Message")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$VbdUuid
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
        foreach ($id in $VbdUuid)
        {
            $uri = "$script:XoHost/rest/v0/vbds/$id/messages"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoMessageObject
        }
    }
}
