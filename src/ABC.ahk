class ABC {
  __get(name){
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __set(name, value){
    throw Exception("property ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
  }

  __call(name, args*){
    super := ObjGetBase(this)
    if(super.__class == ""){
      throw Exception("method ``" . name . "' does not exist on class ``" . this.__class . "'`n", -1)
    }
    method := ObjRawGet(super, name)
    return method.Call(super, args*)
  }

  isSubClass(cls){
    return this.__class == cls.__class
  }
}
