#NoTrayIcon
#Include <Yunit>
#Include <StdOut>
#Include <JUnit>
#Include Includes.ahk

#Include test/ABC_spec.ahk
Yunit.Use(YunitJUnit, YunitStdout).Test(ABC_spec)