# SPDX-License-Identifier: Apache-2.0

function Set-XoVdi {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [Alias("VdiId")]
        [string]$VdiUuid,

        [Parameter()]
        [string]$Name,

        [Parameter()]
        [string]$Description
    )

    $params = @{}

    if ($PSBoundParameters.ContainsKey("Name")) {
        $params["name_label"] = $Name
    }
    if ($PSBoundParameters.ContainsKey("Description")) {
        $params["name_description"] = $Description
    }

    if ($params.Count -gt 0) {
        $body = [System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json $params))
        Invoke-RestMethod -Uri "$script:XoHost/rest/v0/vdis/$VdiUuid" @script:XoRestParameters -Method Patch -ContentType "application/json" -Body $body
    }
}
