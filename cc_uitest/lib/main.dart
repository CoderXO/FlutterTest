
import 'package:cc_uitest/Tool/Tool.dart';
import 'package:flutter/material.dart';
import 'package:cc_uitest/ListController.dart';
import 'package:cc_uitest/HomeController.dart';
import 'RouteConfig.dart';
import 'package:cc_uitest/NotificationCenter.dart';

void main() => runApp(MainApp());



class MainApp extends StatefulWidget {
  @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return MaterialApp(
  //       home: MyApp(),
  //       debugShowCheckedModeBanner: false,
  //   );
  // }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainAppState();
  }
  
}


class MainAppState extends State<MainApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      routes: RouteList.route,
    );
  }
    
}


class MyApp extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
  
}


class MyAppState extends State<MyApp>  with WidgetsBindingObserver,NotificationCallBackMethod {

  String content = 'Kandersteg, Switzerland';
  String txtStr = 'yyyyy';
  int num = 0;
  
 @override
  void notificationCallBack(name, Map parm) {
    // TODO: implement notificationCallBack
    super.notificationCallBack(name, parm);
    num++;
    if(num > 2){
      NotificationCenter.removeNotification(this, "cxl");
    }
    print("通知参数:$parm");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    NotificationCenter.addObserver(this, "cxl");
  }

  @override
  void didUpdateWidget(MyApp oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('====didUpdateWidget====');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TODO: implement build
    return  Scaffold(
        appBar: AppBar(
          title: Text("首页",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
          children: <Widget>[
            setupImage(),
            setupTitle(),
            setupMsg(),

          ],
        ),
        ),
        );
  }

  setupImage() {
    return Container(
      width: ScreenWidth-20,
      height: 220,
      // child: imgCorner("img/tt1.jpg", 10,path:"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=860747650,3685523174&fm=26&gp=0.jpg",type:BoxFit.fitWidth),
      child: imgCorner("img/152566.gif", 5,type: BoxFit.cover),
    );
  }
  
  setupTitle() {

    return Row(
      children: <Widget>[
        Column(
          
          children: <Widget>[
            Container(height: 5,),
            Text("Oeschinen Lake Campground",style:TextStyle(color:hexToColor("#333333"),fontWeight: FontWeight.bold)),
            Text(this.content,style:TextStyle(color: Colors.grey[500])),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        Expanded(
          child:Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
              Icon(Icons.star,color: Colors.blue,),
              Text("31",style:TextStyle(color: Colors.black87)),
              Container(width: 10,),
          ],
        ) ,
        )

      ],
    );
  }

  setupMsg()  {
    return Column(
      children: <Widget>[
        Container(height: 20,),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             msgButton(Icons.send, '发消息'),
             msgButton(Icons.phone, '打电话'),
             msgButton(Icons.share, '分享'),
            
           ],
          )
      ],
    );

  }


  msgButton(IconData iconType,String name) {
      return FlatButton(
        child:Column(
          children: <Widget>[
            Icon(iconType,color: Colors.blue,),
            Text(name,style: TextStyle(color: Colors.blue),),
          ],
         ),
         onPressed: () async {
            print('$name');
          String str = await push(this.context, ListViewController(txtStr, 'CXL'));
          setState(() {
            if(str != null){
              this.txtStr = str;
              this.content = str;
              print('返回::::$str');
            }
          });
         },
        //  highlightColor: Colors.red,
         splashColor:  alphaColor,
      );
  }


}


test() {
    return Container(
      width: ScreenWidth-25,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: Colors.blue
      ),
      child: Text('登录',style: TextStyle(color: Colors.white,fontWeight:FontWeight.w500,fontSize: 18),),
    );

}