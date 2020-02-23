$allOutput = & "$env:ProgramFiles\AutoHotkey\AutoHotkey.exe" ".\TestSuite.ahk" | more 2>&1

if ($allOutput -clike "*FAIL*") {
  Write-Output $allOutput
  exit 1
}

Write-Host "ALL TESTS PASSING"

if ($env:APPVEYOR_JOB_ID) {
  # upload results to AppVeyor
  $wc = New-Object 'System.Net.WebClient'
  $wc.UploadFile("https://ci.appveyor.com/api/testresults/xunit/$($env:APPVEYOR_JOB_ID)", (Resolve-Path .\junit.xml))
}