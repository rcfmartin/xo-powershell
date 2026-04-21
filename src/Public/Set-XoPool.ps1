# SPDX-License-Identifier: Apache-2.0

function Set-XoPool
{
    <#
    .SYNOPSIS
    Set XO pool

    .DESCRIPTION
    Update properties of a pool in Xen Orchestra.

    .PARAMETER PoolUuid
    Target Pool uuid

    .PARAMETER Name
    Target pool name

    .PARAMETER Description
    target pool description

    .PARAMETER Tags
    Target pool tags

    .EXAMPLE
    Set-XoPool -PoolUuid '011ccf6a-c5ad-48ec-a255-d056584686f0' -Name 'New Pool Name'
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [Alias("PoolId")]
        [string]$PoolUuid,

        [Parameter()]
        [string]$Name,

        [Parameter()]
        [string]$Description,

        [Parameter()]
        [string[]]$Tags
    )
    process
    {

        $params = @{}

        if ($PSBoundParameters.ContainsKey("Name"))
        {
            $params["name_label"] = $Name
        }
        if ($PSBoundParameters.ContainsKey("Description"))
        {
            $params["name_description"] = $Description
        }
        if ($PSBoundParameters.ContainsKey("Tags"))
        {
            $params["tags"] = $Tags
        }

        if ($params.Count -gt 0)
        {
            if ($PSCmdlet.ShouldProcess($PoolUuid, "Set pool on target"))
            {

                $body = [System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json $params))
                Invoke-RestMethod -Uri "$script:XoHost/rest/v0/pools/$PoolUuid" @script:XoRestParameters -Method Patch -ContentType "application/json" -Body $body
            }
        }
    }
}
