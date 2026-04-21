# SPDX-License-Identifier: Apache-2.0

function Get-XoSrMessage
{
    <#
    .SYNOPSIS
        List messages for a Sr.
    .DESCRIPTION
        Retrieve messages associated with a specific Xen Orchestra Sr.
    .PARAMETER SrUuid
        The UUID of the Sr whose messages to retrieve.
    .EXAMPLE
        Get-XoSrMessage -SrUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Message")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$SrUuid
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
        foreach ($id in $SrUuid)
        {
            $uri = "$script:XoHost/rest/v0/srs/$id/messages"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoMessageObject
        }
    }
}
