# SPDX-License-Identifier: Apache-2.0

function Set-XoVmTag
{
    <#
    .SYNOPSIS
        Add or remove a tag on a vm.
    .DESCRIPTION
        Attach a single tag to a specific Xen Orchestra vm. Use -Remove to detach the tag instead.
    .PARAMETER VmUuid
        The UUID of the vm to tag.
    .PARAMETER Tag
        The tag value to add or remove.
    .PARAMETER Remove
        Remove the tag instead of adding it.
    .EXAMPLE
        Set-XoVmTag -VmUuid "00000000-0000-0000-0000-000000000000" -Tag "production"
    .EXAMPLE
        Set-XoVmTag -VmUuid "00000000-0000-0000-0000-000000000000" -Tag "production" -Remove
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [ValidateNotNullOrEmpty()]
        [string]$VmUuid,

        [Parameter(Mandatory, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string]$Tag,

        [Parameter()]
        [switch]$Remove
    )

    process
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $method = if ($Remove) { "Delete" } else { "Put" }
        $verb   = if ($Remove) { "remove tag '$Tag'" } else { "add tag '$Tag'" }

        if ($PSCmdlet.ShouldProcess($VmUuid, $verb))
        {
            $uri = "$script:XoHost/rest/v0/vms/$VmUuid/tags/$Tag"
            Invoke-RestMethod -Uri $uri -Method $method @script:XoRestParameters
        }
    }
}
