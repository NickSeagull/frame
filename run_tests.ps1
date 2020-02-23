$allOutput = & "$env:ProgramFiles\AutoHotkey\AutoHotkey.exe" ".\TestSuite.ahk" | more 2>&1

if ($allOutput -clike "*FAIL*") {
  Write-Output $allOutput
  exit 1
}

Write-Host "ALL TESTS PASSING"