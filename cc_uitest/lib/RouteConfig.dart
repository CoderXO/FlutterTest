import 'package:flutter/material.dart';
import 'package:cc_uitest/main.dart';


 String route_Home = '/Home';

//路由列表
class RouteList {
  static Map<String,WidgetBuilder> route = {
     route_Home:(BuildContext con) => MainApp(),
  };
}