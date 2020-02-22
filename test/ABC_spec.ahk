class ABCTestedClass extends ABC {
  iDontThrow(){
    return false
  }
  static existingProperty := "Hello"
}

class ABC_spec {

    the_call_metamethod_should_throw_on_unexpected_method(){
      thrown := false
      try {
        ABCTestedClass.iDontExist()
      } catch e {
        MsgBox (e.message)
        thrown := true
      }
    }

    the_call_metamethod_should_not_throw_on_existing_method(){
      thrown := false
      try {
        ABCTestedClass.iDontThrow()
      } catch e {
        MsgBox (e.message)
        thrown := true
      }
    }

    the_get_metamethod_should_throw_on_unexpected_property(){
      Msgbox test 3
      thrown := false
      x := 12
      try {
        x := ABCTestedClass.nonExitentProperty
      } catch e {
        thrown := true
      }
    }

    the_get_metamethod_should_not_throw_on_exiting_property(){
      Msgbox test 4
      thrown := false
      x := ""
      try {
        x := ABCTestedClass.existingProperty
      } catch e {
        thrown := true
      }
    }

}