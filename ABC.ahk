/**
*
*/
class ABC {
  ; __Type(){
  ;   return this.__class
  ; }

  __Call(methodName, params*){
    if(!this[methodName]){
      throw Exception("undefined method `" . methodName . "' for ", -1)
    }
    this[methodName].call(params*)
  }

  __Get(propName){
    if(!this[propName]){
      throw Exception("Cannot get property named " . propName, -1)
    }
  }
}