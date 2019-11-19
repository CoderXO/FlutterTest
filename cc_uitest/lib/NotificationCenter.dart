import 'package:flutter/cupertino.dart';


  
Map notObserver = Map();
typedef NotificationFunction = Function(String name,Map parm);


class  NotificationCenter  {

  NotificationFunction callBack;

  NotificationCenter() {
  }
  
  NotificationCenter.addObserver(observer,String name) {
       List arr = notObserver[observer];
       if(arr == null){
         notObserver[observer] = [name];
       }else{
         arr.add(name);
         notObserver[observer] = arr;
       }
  }

  NotificationCenter.postNotification(String name,Map parm) {
       var keyArr =  notObserver.keys;
       for (var item in keyArr) {
         List<String> nameArr = notObserver[item];
         if(nameArr != null){
           for (String nameStr in nameArr) {
              if(nameStr == name){
                 item.notificationCallBack(name,parm);
              }
           }
         }
       }
       
  }

  NotificationCenter.removeNotification(obs,String name) {
       List nameArr = notObserver[obs];
       if(nameArr != null){
         nameArr.removeWhere((value) {
             return  nameArr.contains(name);
         }); 
       }
  }

  NotificationCenter.removeAllNotification(Widget obs) {
      if(notObserver.containsKey(obs)){
        notObserver.remove(obs);
      }       
  }

}

mixin NotificationCallBackMethod  {
    void notificationCallBack(name,Map parm) {
     
    }
}
