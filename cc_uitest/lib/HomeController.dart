

import 'package:cc_uitest/Tool/Tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cc_uitest/RouteConfig.dart';
import 'package:cc_uitest/WebviewController.dart';
import 'package:cc_uitest/MainScrollView.dart';

class HomeVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: IconButton(
          icon: Icon(Icons.bluetooth_connected),
          onPressed: (){
            push(context,WebviewController('https://www.baidu.com'));
            // Navigator.popAndPushNamed(context,route_Home);
            // Navigator.popAndPushNamed(context, '/');
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('This Home Pahe'),
        ),
      ),
    );
    }

  //   return Container(
  //     width: ScreenWidth,
  //     height: ScreenHeight,
  //     child: Image.asset('img/tt1.jpg'),
  //     color: Colors.blue,
  //   );
  // }
  
}
