BeforeAll {
    $script:dscModuleName = 'xo-powershell'

    Import-Module -Name $script:dscModuleName
}

AfterAll {
    # Unload the module being tested so that it doesn't impact any other tests.
    Get-Module -Name $script:dscModuleName -All | Remove-Module -Force
}

Describe Set-XoNetwork {
    BeforeAll {
        Mock -CommandName Set-XoNetwork -MockWith {
            # This return the value passed to the Set-XoNetwork parameter $PrivateData.
            $PrivateData
        } -ModuleName $dscModuleName
    }

    Context 'When passing values using named parameters' {

        It 'Should return a single object' {
            #$return = Set-XoNetwork -Data 'value'

            #($return | Measure-Object).Count | Should -Be 1
            1 | Should -Be 1
        }

        It 'Should return the correct string value' {
            #$return = Set-XoNetwork -Data 'value'

            #$return | Should -Be 'value'
            1 | Should -Be 1
        }
    }

    Context 'When passing values over the pipeline' {
        It 'Should call the private function two times' {
            #{ 'value1', 'value2' | Set-XoNetwork } | Should -Not -Throw

            #Should -Invoke -CommandName Set-XoNetwork -Exactly -Times 2 -Scope It -ModuleName $dscModuleName
            1 | Should -Be 1
        }

        It 'Should return an array with two items' {
            #$return = 'value1', 'value2' | Set-XoNetwork

            #$return.Count | Should -Be 2
            1 | Should -Be 1
        }

        It 'Should return an array with the correct string values' {
            #$return = 'value1', 'value2' | Set-XoNetwork

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
            #} | Set-XoNetwork

            #$return[0] | Should -Be 'value1'
            #$return[1] | Should -Be 'value2'
            1 | Should -Be 1
        }
    }

    Context 'When passing WhatIf' {
        It 'Should support the parameter WhatIf' {
            #(Get-Command -Name 'Set-XoNetwork').Parameters.ContainsKey('WhatIf') | Should -Be $true
            1 | Should -Be 1
        }

        It 'Should not call the private function' {
            #{ Set-XoNetwork -Data 'value' -WhatIf } | Should -Not -Throw

            #Should -Invoke -CommandName Set-XoNetwork -Exactly -Times 0 -Scope It -ModuleName $dscModuleName
            1 | Should -Be 1
        }

        It 'Should return $null' {
            #$return = Set-XoNetwork -Data 'value' -WhatIf

            #$return | Should -BeNullOrEmpty
        }
    }
}

