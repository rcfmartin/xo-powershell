# SPDX-License-Identifier: Apache-2.0

function ConvertFrom-XoSecureString {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)][securestring]$SecureString
    )

    process {
        $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
        try {
            return [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
        }
        finally {
            [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
        }
    }
}
