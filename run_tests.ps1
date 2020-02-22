$allOutput = & "$env:ProgramFiles\AutoHotkey\AutoHotkey.exe" ".\TestSuite.ahk" | more 2>&1

Write-Host $allOutput
if ($allOutput -clike "*FAIL*") {
  Write-Host "Exit failure"
  exit 1
}

if ($env:APPVEYOR_JOB_ID) {
  # upload results to AppVeyor
  $wc = New-Object 'System.Net.WebClient'
  $wc.UploadFile("https://ci.appveyor.com/api/testresults/xunit/$($env:APPVEYOR_JOB_ID)", (Resolve-Path .\junit.xml))
}