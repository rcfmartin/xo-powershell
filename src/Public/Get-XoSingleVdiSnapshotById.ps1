# SPDX-License-Identifier: Apache-2.0

function Get-XoSingleVdiSnapshotById
{
    param (
        [string]$VdiSnapshotUuid,
        [hashtable]$Params
    )

    try
    {
        Write-Verbose "Getting VDI snapshot with UUID $VdiSnapshotUuid"
        $uri = "$script:XoHost/rest/v0/vdi-snapshots/$VdiSnapshotUuid"
        $snapshotData = Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $Params

        if ($snapshotData)
        {
            return ConvertTo-XoVdiSnapshotObject -InputObject $snapshotData
        }
    }
    catch
    {
        throw ("Failed to retrieve VDI snapshot with UUID {0}: {1}" -f $VdiSnapshotUuid, $_)
    }
    return $null
}
