# SPDX-License-Identifier: Apache-2.0

function Format-XoSize {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)][long]$Value
    )

    # based off of https://stackoverflow.com/a/40887001/8642889

    $suffix = " B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"
    $index = 0
    while ($Value -gt 1kb -and $index -lt $suffix.Length) {
        $Value = $Value / 1kb
        $index++
    }

    "{0:N1} {1}" -f $Value, $suffix[$index]
}
