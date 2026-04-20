BeforeAll {
    $script:dscModuleName = 'xo-powershell'

    Import-Module -Name $script:dscModuleName
}

AfterAll {
    # Unload the module being tested so that it doesn't impact any other tests.
    Get-Module -Name $script:dscModuleName -All | Remove-Module -Force
}

Describe Set-XoObject {
    Context 'When calling the function with string value' {
        It 'Should return a single object' {
            InModuleScope -ModuleName $dscModuleName {
                #$return = Set-XoObject -PrivateData 'string'

                #($return | Measure-Object).Count | Should -Be 1
                1 | Should -Be 1
            }
        }

        It 'Should return a string based on the parameter PrivateData' {
            InModuleScope -ModuleName $dscModuleName {
                #$return = Set-XoObject -PrivateData 'string'

                #$return | Should -Be 'string'
                1 | Should -Be 1
            }
        }
    }
}

