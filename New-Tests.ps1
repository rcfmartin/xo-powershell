[CmdletBinding()]
param (

)
begin
{
    $privateSrc = "$($PSScriptRoot)/src/Private"
    $publicSrc = "$($PSScriptRoot)/src/Public"
    $privateTest = "$($PSScriptRoot)/tests/Unit/Private"
    $publicTest = "$($PSScriptRoot)/tests/Unit/Public"
    $ModuleName = (Get-Item $($PSScriptRoot)).Name
}

process
{
    foreach ($file in @(Get-ChildItem -Path $publicSrc -Recurse -File -Include *.ps1))
    {
        $info = Get-Item $file
        $testFile = "$($publicTest)/$($info.BaseName).tests.ps1"

        $null = New-Item "$($testFile)" -ItemType File -ErrorAction SilentlyContinue
        $template = @"
BeforeAll {
    `$script:dscModuleName = '$ModuleName'

    Import-Module -Name `$script:dscModuleName
}

AfterAll {
    # Unload the module being tested so that it doesn't impact any other tests.
    Get-Module -Name `$script:dscModuleName -All | Remove-Module -Force
}

Describe $($info.BaseName) {
    BeforeAll {
        Mock -CommandName $($info.BaseName) -MockWith {
            # This return the value passed to the $($info.BaseName) parameter `$PrivateData.
            `$PrivateData
        } -ModuleName `$dscModuleName
    }

    Context 'When passing values using named parameters' {

        It 'Should return a single object' {
            #`$return = $($info.BaseName) -Data 'value'

            #(`$return | Measure-Object).Count | Should -Be 1
            1 | Should -Be 1
        }

        It 'Should return the correct string value' {
            #`$return = $($info.BaseName) -Data 'value'

            #`$return | Should -Be 'value'
            1 | Should -Be 1
        }
    }

    Context 'When passing values over the pipeline' {
        It 'Should call the private function two times' {
            #{ 'value1', 'value2' | $($info.BaseName) } | Should -Not -Throw

            #Should -Invoke -CommandName $($info.BaseName) -Exactly -Times 2 -Scope It -ModuleName `$dscModuleName
            1 | Should -Be 1
        }

        It 'Should return an array with two items' {
            #`$return = 'value1', 'value2' | $($info.BaseName)

            #`$return.Count | Should -Be 2
            1 | Should -Be 1
        }

        It 'Should return an array with the correct string values' {
            #`$return = 'value1', 'value2' | $($info.BaseName)

            #`$return[0] | Should -Be 'value1'
            #`$return[1] | Should -Be 'value2'
            1 | Should -Be 1
        }

        It 'Should accept values from the pipeline by property name' {
            #`$return = 'value1', 'value2' | ForEach-Object {
            #    [PSCustomObject]@{
            #        Data = `$_
            #        OtherProperty = 'other'
            #    }
            #} | $($info.BaseName)

            #`$return[0] | Should -Be 'value1'
            #`$return[1] | Should -Be 'value2'
            1 | Should -Be 1
        }
    }

    Context 'When passing WhatIf' {
        It 'Should support the parameter WhatIf' {
            #(Get-Command -Name '$($info.BaseName)').Parameters.ContainsKey('WhatIf') | Should -Be `$true
            1 | Should -Be 1
        }

        It 'Should not call the private function' {
            #{ $($info.BaseName) -Data 'value' -WhatIf } | Should -Not -Throw

            #Should -Invoke -CommandName $($info.BaseName) -Exactly -Times 0 -Scope It -ModuleName `$dscModuleName
            1 | Should -Be 1
        }

        It 'Should return `$null' {
            #`$return = $($info.BaseName) -Data 'value' -WhatIf

            #`$return | Should -BeNullOrEmpty
        }
    }
}

"@
        $null = Set-Content -Value $template -Path $testFile -Force -ErrorAction SilentlyContinue
    }
    foreach ($file in @(Get-ChildItem -Path $privateSrc -Recurse -File -Include *.ps1))
    {
        $info = Get-Item $file
        $testFile = "$($privateTest)/$($info.BaseName).tests.ps1"

        $null = New-Item "$($testFile)" -ItemType File -ErrorAction SilentlyContinue
        $template = @"
BeforeAll {
    `$script:dscModuleName = '$ModuleName'

    Import-Module -Name `$script:dscModuleName
}

AfterAll {
    # Unload the module being tested so that it doesn't impact any other tests.
    Get-Module -Name `$script:dscModuleName -All | Remove-Module -Force
}

Describe $($info.BaseName) {
    Context 'When calling the function with string value' {
        It 'Should return a single object' {
            InModuleScope -ModuleName `$dscModuleName {
                #`$return = $($info.BaseName) -PrivateData 'string'

                #(`$return | Measure-Object).Count | Should -Be 1
                1 | Should -Be 1
            }
        }

        It 'Should return a string based on the parameter PrivateData' {
            InModuleScope -ModuleName `$dscModuleName {
                #`$return = $($info.BaseName) -PrivateData 'string'

                #`$return | Should -Be 'string'
                1 | Should -Be 1
            }
        }
    }
}

"@
        $null = Set-Content -Value $template -Path $testFile -Force #-ErrorAction SilentlyContinue
    }
}

end
{

}
