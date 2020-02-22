class ABCTest {
  class TestedClass extends ABC {
    iDontThrow(){
      return false
    }
  }

  the_call_metamethod_must_throw_on_unexpected_method(){
    thrown := false
    try {
      thrown := this.TestedClass.iDontExist()
    } catch e {
      thrown := true
    }
    Yunit.assert(thrown == true)
  }

  the_call_metamethod_must_not_throw_on_existing_method(){
    thrown := false
    try {
      thrown := this.TestedClass.iDontThrow()
    } catch e {
      thrown := true
    }
    Yunit.assert(thrown == false)
  }
}