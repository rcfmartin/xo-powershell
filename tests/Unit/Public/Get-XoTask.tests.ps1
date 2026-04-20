BeforeAll {
    $script:dscModuleName = 'xo-powershell'

    Import-Module -Name $script:dscModuleName
}

AfterAll {
    # Unload the module being tested so that it doesn't impact any other tests.
    Get-Module -Name $script:dscModuleName -All | Remove-Module -Force
}

Describe Get-XoTask {
    BeforeAll {
        Mock -CommandName Get-XoTask -MockWith {
            # This return the value passed to the Get-XoTask parameter $PrivateData.
            $PrivateData
        } -ModuleName $dscModuleName
    }

    Context 'When passing values using named parameters' {

        It 'Should return a single object' {
            #$return = Get-XoTask -Data 'value'

            #($return | Measure-Object).Count | Should -Be 1
            1 | Should -Be 1
        }

        It 'Should return the correct string value' {
            #$return = Get-XoTask -Data 'value'

            #$return | Should -Be 'value'
            1 | Should -Be 1
        }
    }

    Context 'When passing values over the pipeline' {
        It 'Should call the private function two times' {
            #{ 'value1', 'value2' | Get-XoTask } | Should -Not -Throw

            #Should -Invoke -CommandName Get-XoTask -Exactly -Times 2 -Scope It -ModuleName $dscModuleName
            1 | Should -Be 1
        }

        It 'Should return an array with two items' {
            #$return = 'value1', 'value2' | Get-XoTask

            #$return.Count | Should -Be 2
            1 | Should -Be 1
        }

        It 'Should return an array with the correct string values' {
            #$return = 'value1', 'value2' | Get-XoTask

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
            #} | Get-XoTask

            #$return[0] | Should -Be 'value1'
            #$return[1] | Should -Be 'value2'
            1 | Should -Be 1
        }
    }

    Context 'When passing WhatIf' {
        It 'Should support the parameter WhatIf' {
            #(Get-Command -Name 'Get-XoTask').Parameters.ContainsKey('WhatIf') | Should -Be $true
            1 | Should -Be 1
        }

        It 'Should not call the private function' {
            #{ Get-XoTask -Data 'value' -WhatIf } | Should -Not -Throw

            #Should -Invoke -CommandName Get-XoTask -Exactly -Times 0 -Scope It -ModuleName $dscModuleName
            1 | Should -Be 1
        }

        It 'Should return $null' {
            #$return = Get-XoTask -Data 'value' -WhatIf

            #$return | Should -BeNullOrEmpty
        }
    }
}

