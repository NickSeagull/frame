#Include <Yunit>
#Include <StdOut>
#Include <JUnit>
#Include <Window>
#Include Init.ahk

#Include test/ABC_spec.ahk
#Include test/StdLib_spec.ahk

assertEq(expected, actual){
  Yunit.assert(expected == actual, "Expected ``" . expected . "' but got ``" . actual . "'`n")
}

Yunit.Use(YunitJUnit, YunitStdOut).Test(ABC_spec, StdLib_spec)
exitapp