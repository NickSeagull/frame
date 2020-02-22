class ABCTest {
  class TestedClass extends ABC {
    iDontThrow(){
      return false
    }
  }

  test_call_must_throw_on_unexpected_method(){
    thrown := false
    try {
      thrown := this.TestedClass.iDontExist()
    } catch e {
      thrown := true
    }
    Yunit.assert(thrown == true)
  }

  test_call_must_not_throw_on_existing_method(){
    thrown := false
    try {
      thrown := this.TestedClass.iDontThrow()
    } catch e {
      thrown := true
    }
    Yunit.assert(thrown == false)
  }
}