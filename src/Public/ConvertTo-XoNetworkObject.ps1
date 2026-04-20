# SPDX-License-Identifier: Apache-2.0

$script:XO_NETWORK_FIELDS = "automatic,defaultIsLocked,MTU,name_description,name_label,tags,PIFs,VIFs,nbd,uuid,`$pool"

function ConvertTo-XoNetworkObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            NetworkUuid = $InputObject.uuid
            Name        = $InputObject.name_label
            Description = $InputObject.name_description
            PifUuid     = $InputObject.PIFs
            VifUuid     = $InputObject.VIFs
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Network -Properties $props
    }
}
