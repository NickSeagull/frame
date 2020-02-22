$allOutput = & "$env:ProgramFiles\AutoHotkey\AutoHotkey.exe" ".\TestSuite.ahk" | more 2>&1

Write-Host $allOutput
if ($allOutput -clike "*FAIL*") {
  Write-Host "Exit failure"
  exit 1
}