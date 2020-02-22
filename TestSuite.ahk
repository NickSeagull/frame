#NoTrayIcon
#Persistent
#Include <Yunit>
#Include <StdOut>
#Include <JUnit>
#Include <Window>
#Include Includes.ahk

#Include test/ABC_spec.ahk
Yunit.Use(YunitStdOut).Test(ABC_spec)