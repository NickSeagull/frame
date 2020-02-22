#NoTrayIcon
#Include <Yunit>
#Include <StdOut>
#Include <JUnit>
#Include Includes.ahk

#Include test/ABCTest.ahk
Yunit.Use(YunitJUnit, YunitStdout).Test(ABCTest)