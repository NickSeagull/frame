class ABCTestedClass extends ABC {
  iDontThrow(){
    return false
  }
  static existingProperty := "Hello"
}

class ABC_spec {

  class the_call_metafunction {

    should_throw_on_unexpected_method(){
      thrown := false
      try {
        ABCTestedClass.iDontExist()
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown)
    }

    should_not_throw_on_existing_method(){
      thrown := false
      try {
        ABCTestedClass.iDontThrow()
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown == false)
    }

  }

  class the_get_metafunction{

    should_throw_on_unexpected_property(){
      thrown := false
      x := 12
      try {
        x := ABCTestedClass.nonExitentProperty
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown)
    }

    should_not_throw_on_exiting_property(){
      thrown := false
      x := ""
      try {
        x := ABCTestedClass.existingProperty
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown == false, "Did throw")
      assertEq(x, "Hello")
    }
  }

  class the_set_metafunction{

    should_throw_on_unexpected_property(){
      thrown := false
      x := 12
      try {
        ABCTestedClass.nonExitentProperty := "some value"
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown, "Did not throw")
    }

    should_not_throw_on_exiting_property(){
      thrown := false
      x := ""
      try {
        ABCTestedClass.existingProperty := "world"
        x := ABCTestedClass.existingProperty
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown == false, "Did throw")
      assertEq(x, "world")
    }
  }


}