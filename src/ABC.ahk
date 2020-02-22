/**
*
*/
class ABC {
  ; __Type(){
  ;   return this.__class
  ; }

  __Call(methodName, params*){
    MsgBox % "Calling " . methodName
    if !this[methodName]
      throw Exception("undefined method `" . methodName . "' for ", -1)
    MsgBox % "Calling " . methodName
    result := this[methodName].call(params*)
    MsgBox % "Got " . result
    return result
  }

  __Get(propName){
    if(!this[propName]){
      throw Exception("Cannot get property named " . propName, -1)
    }
    return this[propName]
  }
}