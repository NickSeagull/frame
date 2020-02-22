class ABCTestedClass extends ABC {
  iDontThrow(){
    return false
  }
}
class ABC_spec {

  class the_call_metamethod {
    should_throw_on_unexpected_method(){
      thrown := false
      try {
        thrown := ABCTestedClass.iDontExist()
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown == true)
    }

    should_not_throw_on_existing_method(){
      thrown := false
      try {
        thrown := ABCTestedClass.iDontThrow()
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown == false)
    }
  }


}