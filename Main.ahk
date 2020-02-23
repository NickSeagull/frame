#Include Includes.ahk

class TestABC extends ABC {
  static foo := "hello"
  bar(){
    MsgBox hi
  }
}

x := TestABC.lol
listvars
pause
y := TestABC.foo
listvars
pause
Test.ABC.bar()
listvars
pause
Test.ABC.quux()
