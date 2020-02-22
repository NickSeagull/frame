#Include Includes.ahk

class TestABC extends ABC {
  static foo := "hello"
  bar(){
    return "world"
  }
}

x := TestABC.lol
y := TestABC.foo
Test.ABC.bar()
Test.ABC.quux()
