# SPDX-License-Identifier: Apache-2.0

function Set-XoObject
{
    <#
    .SYNOPSIS
    Set Xo Object with custom type

    .DESCRIPTION
    Set Xo Object with custom type

    .PARAMETER InputObject
    Target object

    .PARAMETER TypeName
    Custom Type Name

    .PARAMETER Properties
    Target object properties

    .EXAMPLE
    Set-XoObject $InputObject -TypeName XoPowershell.MyCustomType -Properties $props
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'low')]
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject,
        [Parameter()][string]$TypeName,
        [Parameter()][hashtable]$Properties
    )
    process
    {
        if ($PSCmdlet.ShouldProcess($TypeName, "Setting object "))
        {

            if ($TypeName)
            {
                $InputObject.PSObject.TypeNames.Insert(0, $TypeName) > $null
            }
            if ($Properties)
            {
                foreach ($key in $Properties.Keys)
                {
                    $InputObject.PSObject.Properties.Add([psnoteproperty]::new($key, $Properties[$key])) > $null
                }
            }
            [PSCustomObject]$InputObject
        }
    }
}
