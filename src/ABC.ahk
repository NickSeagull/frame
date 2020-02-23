class ABC {
  __get(name){
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __set(name, value){
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __call(name){
    throw Exception("method ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }
}
