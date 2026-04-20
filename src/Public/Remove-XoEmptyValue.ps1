# SPDX-License-Identifier: Apache-2.0

function Remove-XoEmptyValue
{
    <#
    .SYNOPSIS
    Removes XO empty values

    .DESCRIPTION
    Removes XO empty values

    .PARAMETER InputObject
    Target object

    .EXAMPLE
    Remove-XoEmptyValue -InputObject $MyObject
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
    [OutputType([hashtable])]
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [ValidateNotNull()]
        [System.Collections.IDictionary]$InputObject
    )
    process
    {
        if ($PSCmdlet.ShouldProcess('Remove Empty values from target'))
        {

            $ret = @{}

            foreach ($kv in $InputObject.GetEnumerator())
            {
                if ($null -ne $kv.Value -and ![string]::IsNullOrEmpty($kv.Value -as [string]))
                {
                    $ret.Add($kv.Key, $kv.Value)
                }
            }
            return $ret
        }
    }
}
