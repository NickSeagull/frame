class ABCTestedClass extends ABC {

  iDontThrow(){
    return false
  }
  static existingProperty := "Hello"
}

class SubTestClass extends ABCTestedClass {
}

class OrphanClass extends ABC{

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
      assertEq(thrown, true)
    }

    should_not_throw_on_existing_method(){
      thrown := false
      try {
        ABCTestedClass.iDontThrow()
      } catch e {
        thrown := true
      }
      assertEq(thrown, false)
    }
  }

  class the_get_metafunction{
    should_throw_on_unexpected_property(){
      thrown := false
      x := 12
      try {
        x := ABCTestedClass.nonExistentProperty
      } catch e {
        thrown := true
      }
      assertEq(thrown, true)
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

    should_not_throw_on_exiting_property_of_superclass(){
      thrown := false
      x := ""
      try {
        SubTestClass.existingProperty := "world"
        x := SubTestClass.existingProperty
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown == false, "Did throw")
      assertEq(x, "world")
    }
  }

  class the_isSubClass_method{
    should_return_true_for_a_class_that_derives_directly(){
      derives := ABCTestedClass.isSubClass(ABC)
      assertEq(derives, true)
    }

    should_return_true_for_a_class_that_derives_transitively(){
      derives := SubTestClass.isSubClass(ABC)
      assertEq(derives, true)
    }

    should_return_false_for_a_class_that_is_not_a_subclass(){
      derives := OrphanClass.isSubClass(ABCTestedClass)
      assertEq(derives, false)
    }
  }
}