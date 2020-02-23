class ABC {
  __get(name){
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __set(name, value){
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __call(name, args*){
    if(ObjHasKey(this, name)){
      method := ObjRawGet(this, name)
      return method.Call(args*)
    }
    super := ObjGetBase(this)
    superClass := super.__class
    if(super.__class = ""){
      throw Exception("method ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
    }
  }

  isSubClass(cls){
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
