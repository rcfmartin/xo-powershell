# SPDX-License-Identifier: Apache-2.0

function Set-XoObject
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject,
        [Parameter()][string]$TypeName,
        [Parameter()][hashtable]$Properties
    )

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
