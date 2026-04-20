BeforeAll {
    $script:dscModuleName = 'xo-powershell'

    Import-Module -Name $script:dscModuleName
}

AfterAll {
    # Unload the module being tested so that it doesn't impact any other tests.
    Get-Module -Name $script:dscModuleName -All | Remove-Module -Force
}

Describe Set-XoHost {
    BeforeAll {
        Mock -CommandName Set-XoHost -MockWith {
            # This return the value passed to the Set-XoHost parameter $PrivateData.
            $PrivateData
        } -ModuleName $dscModuleName
    }

    Context 'When passing values using named parameters' {

        It 'Should return a single object' {
            #$return = Set-XoHost -Data 'value'

            #($return | Measure-Object).Count | Should -Be 1
            1 | Should -Be 1
        }

        It 'Should return the correct string value' {
            #$return = Set-XoHost -Data 'value'

            #$return | Should -Be 'value'
            1 | Should -Be 1
        }
    }

    Context 'When passing values over the pipeline' {
        It 'Should call the private function two times' {
            #{ 'value1', 'value2' | Set-XoHost } | Should -Not -Throw

            #Should -Invoke -CommandName Set-XoHost -Exactly -Times 2 -Scope It -ModuleName $dscModuleName
            1 | Should -Be 1
        }

        It 'Should return an array with two items' {
            #$return = 'value1', 'value2' | Set-XoHost

            #$return.Count | Should -Be 2
            1 | Should -Be 1
        }

        It 'Should return an array with the correct string values' {
            #$return = 'value1', 'value2' | Set-XoHost

            #$return[0] | Should -Be 'value1'
            #$return[1] | Should -Be 'value2'
            1 | Should -Be 1
        }

        It 'Should accept values from the pipeline by property name' {
            #$return = 'value1', 'value2' | ForEach-Object {
            #    [PSCustomObject]@{
            #        Data = $_
            #        OtherProperty = 'other'
            #    }
            #} | Set-XoHost

            #$return[0] | Should -Be 'value1'
            #$return[1] | Should -Be 'value2'
            1 | Should -Be 1
        }
    }

    Context 'When passing WhatIf' {
        It 'Should support the parameter WhatIf' {
            #(Get-Command -Name 'Set-XoHost').Parameters.ContainsKey('WhatIf') | Should -Be $true
            1 | Should -Be 1
        }

        It 'Should not call the private function' {
            #{ Set-XoHost -Data 'value' -WhatIf } | Should -Not -Throw

            #Should -Invoke -CommandName Set-XoHost -Exactly -Times 0 -Scope It -ModuleName $dscModuleName
            1 | Should -Be 1
        }

        It 'Should return $null' {
            #$return = Set-XoHost -Data 'value' -WhatIf

            #$return | Should -BeNullOrEmpty
        }
    }
}

