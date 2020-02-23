class StdLib_spec {
  class the_abstract_function{
    always_throws(){
      thrown := false
      try {
        abstract()
      } catch e {
        thrown := true
      }
      Yunit.assert(thrown, "Did not throw")
    }
  }
}