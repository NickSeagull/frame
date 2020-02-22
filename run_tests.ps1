$allOutput = & "$env:ProgramFiles\AutoHotkey\AutoHotkey.exe" ".\TestSuite.ahk" | more 2>&1

if ($allOutput -clike "*FAIL*") {
  Write-Host $allOutput
  exit 1
}