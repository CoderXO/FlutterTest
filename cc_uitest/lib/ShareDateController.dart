
import 'package:cc_uitest/Tool/Tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NotificationCenter.dart';

class ShareDataController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShareDataControllerState();
  }

}

class ShareDataControllerState extends State<ShareDataController> {
 
  InheritedContext inh;
  int num1 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // inh = InheritedContext(0);
  }

 
  @override
  Widget build(BuildContext context) {

    inh = InheritedContext(
        num: num1,
        child: setupView(),
      );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('数据共享'),
      ),
      body: inh,
    );
  }

  setupView() {
    return Column(
       children: <Widget>[

         Container(
            height: 40,
         ),
         Container(
            width: ScreenWidth - 40,
            height: 40,
            // alignment: Alignment.center,
            child: RaisedButton(
              color: Colors.blue,
              child: Text('111'),
              onPressed: (){

               NotificationCenter.postNotification('cxl', {"aaa":"cxl"});

                setState(() {
                  num1++;
                });
              },
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
         ),
         ShareTestA(),
       ],
    );
  }



}
  

class ShareTestA extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final inheritedContext = InheritedContext.of(context);
    final num = inheritedContext.num;


    int str = 0;
    if(inheritedContext.num != null){
      str =  inheritedContext.num;
    }
    print('object::::$str');


    // TODO: implement build
    return Container(
      width: ScreenWidth-40,
      height: 64,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text('$str'),
    );
  }
  
}



class InheritedContext extends InheritedWidget {

  int num;

  // final Function() increment;
  // final Function() reduce;

  InheritedContext({@required this.num,Widget child}) : super(child: child);
   
  static InheritedContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedContext);
  }

  @override
  bool updateShouldNotify(InheritedContext oldWidget) {
    return oldWidget.num != num;
  }
    
}