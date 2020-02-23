#Include <Yunit>
#Include <StdOut>
#Include <JUnit>
#Include <Window>
#Include Includes.ahk

#Include test/ABC_spec.ahk

assertEq(expected, actual){
  Yunit.assert(expected == actual, "Expected ``" . expected . "' but got ``" . actual . "'`n")
}

Yunit.Use(YunitJUnit, YunitStdOut).Test(ABC_spec)
exitapp