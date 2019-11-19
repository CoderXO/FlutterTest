

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewController extends StatefulWidget {

  String urlStr = null; 
  WebviewController(this.urlStr);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebviewControllerState();
  }
  
}

class WebviewControllerState extends State<WebviewController> {
  
  String titleStr = 'H5页面';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
        backgroundColor: Colors.green,
      ),
      body: WebView(
        initialUrl: this.widget.urlStr,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}