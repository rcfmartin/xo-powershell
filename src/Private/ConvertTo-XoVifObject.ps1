# SPDX-License-Identifier: Apache-2.0

$script:XO_VIF_FIELDS = "allowedIpv4Addresses,allowedIpv6Addresses,attached,device,lockingMode,MAC,MTU,txChecksumming,uuid,`$network,`$pool"

function ConvertTo-XoVifObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            VifUuid     = $InputObject.uuid
            Name        = $InputObject.name_label
            Description = $InputObject.name_description
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Vif -Properties $props
    }
}
