# SPDX-License-Identifier: Apache-2.0

$script:XO_PIF_FIELDS = "attached,isBondMaster,isBondSlave,device,deviceName,dns,disallowUnplug,gateway,ip,ipv6,mac,management,carrier,mode,ipv6Mode,mtu,netmask,physical,primaryAddressType,vlan,speed,uuid,`$network,`$pool"

function ConvertTo-XoPifObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            PifUuid     = $InputObject.uuid
            Name        = $InputObject.name_label
            Description = $InputObject.name_description
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Pif -Properties $props
    }
}
