class ABC {
  __get(name){
    MsgBox % "Attempting to get " . name . " in class " . this.__class
    super := ObjGetBase(this)
    while (super.__class != ""){
      if(ObjHasKey(super, name)){
        result := ObjRawGet(super, name)
        return result
      }
      super := ObjGetBase(super)
    }
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __set(name, value){
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __call(name, args*){
    super := ObjGetBase(this)
    while (super.__class != ""){
      if(ObjHasKey(super, name)){
        result := ObjRawGet(super, name)
        return result.Call(super, args*)
      }
      super := ObjGetBase(super)
    }
    throw Exception("method ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  isSubClass(cls){
    if (this.__class = cls.__class) {
      return true
    } else {
      super := ObjGetBase(this)
      if (super.__class = ""){
        return false
      }
      result := super.__class == cls.__class
      if (!result) {
        return super.isSubClass(cls)
      } else {
        return result
      }
    }
  }
}
