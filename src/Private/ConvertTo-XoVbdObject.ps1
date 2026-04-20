# SPDX-License-Identifier: Apache-2.0

$script:XO_VBD_FIELDS = "attached,bootable,device,is_cd_drive,position,read_only,uuid,`$pool"

function ConvertTo-XoVbdObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            VbdUuid     = $InputObject.uuid
            IsCdDrive   = $InputObject.is_cd_drive
            ReadOnly    = $InputObject.read_only
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Vbd -Properties $props
    }
}
