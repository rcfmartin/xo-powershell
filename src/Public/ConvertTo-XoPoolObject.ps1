# SPDX-License-Identifier: Apache-2.0

$script:XO_POOL_FIELDS = "auto_poweron,default_SR,HA_enabled,haSrs,master,tags,name_description,name_label,migrationCompression,cpus,zstdSupported,vtpmSupported,platform_version,type,uuid"

function ConvertTo-XoPoolObject {
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]$InputObject
    )

    process {
        $props = @{
            PoolUuid        = $InputObject.uuid
            Name            = $InputObject.name_label
            Description     = $InputObject.name_description
            CpuCores        = $InputObject.cpus.cores
            PlatformVersion = $InputObject.platform_version
            HAEnabled       = $InputObject.HA_enabled
        }
        Set-XoObject $InputObject -TypeName XoPowershell.Pool -Properties $props
    }
}
