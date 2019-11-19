

import 'package:cc_uitest/Tool/Tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cc_uitest/NotificationCenter.dart';
import 'package:event_bus/event_bus.dart';

class MainScrollView extends StatefulWidget {

  EventBus eve;

  MainScrollView(this.eve);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScrollViewState();
  }
}

class MainScrollViewState extends State<MainScrollView> with WidgetsBindingObserver {
  @override
 
  bool isShow = false;
  Container con = null;
  int showIndex = 1;
  Widget wid;

  @override
  void dispose() {
      WidgetsBinding.instance.removeObserver(this);
      super.dispose();
      print('========dispose========');
  }

@override
 void didChangeTextScaleFactor() {
    print("========didChangeTextScaleFactor========");
  }

@override
  void didUpdateWidget(Widget t) {
    print("========didUpdateWidget========");

  }
  
   
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: Text('滑动'),
        backgroundColor: Colors.deepOrange,
      ),
      body:setupGird(),
      // Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         setupOffstage(),
      //         setupBtn(),
      //       ],
      //     ),
    );
  }

  setupScrollView() {
    return Container(
        width:  ScreenWidth,
        height: 100,
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: setupWrap(),
      ),
    );
  }

  setupAspect() {
    return Container(
        height: 200,
        color: Colors.green,
        child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              color: Colors.red,
            ),
          ),
    );
  }

  setupBoxSize() {
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      color: Colors.blue,
      child:Container(
        // width: 200,
        // height: 200,
        color: Colors.orange,
        child:  SizedBox(
        width: 200,
        height: 500,
        child: Container(
          width: 300,
          height: 200,
          color: Colors.green,
        ),
       ),
      ),
    );
  }

  setupOverFlowBox() {
    return Container(
        width: 300,
        height: 300,
        color: Colors.blue,
        child: OverflowBox(
          minWidth: 100,
          maxHeight: 150,
          minHeight: 100,
          maxWidth: 100,
          child: Container(
            width: 200,
            height: 50,
            color: Colors.orange,
          ),
        ),
    );
  }

  setupOffstage() {
    return Container(
      width: 300,
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Offstage(
        offstage: isShow,
        child: Container(
            width: 100,
            height: 100,
            color: Colors.cyan,
        ),
      ),
    );
  }
  
  setupBtn() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: RaisedButton(
        color: alphaColor,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
           alignment: Alignment.center,
           width: ScreenWidth,
           height: 44,
          // color: Colors.blue,
           decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
           ),
           child: Text('登录',style: TextStyle(color: Colors.white),),
        ),
        onPressed: (){
            isShow = !isShow;
            setState(() {
              
            });
            
    
        },
      ),
    );
  }

  setupIntrinsicWidth() {

    
    Container con = Container(
      // height: 200,
      // width: ScreenWidth,
      color: Colors.brown,
      child: IntrinsicWidth(
      // stepHeight: 151,
      stepWidth: 100,
      child: Column(
        children: <Widget>[
          Container(width: 101,height: 30,color: Colors.orange,alignment: Alignment.topLeft,),
          Container(width: 50,height: 130,color: Colors.red,),
          Container(width: 30,height: 130,color: Colors.green,),
          Container(width: 30,height: 30,color: Colors.blue,),
        ],
      ),
    ),
    );
    return con;

  }

  setupListView() {

    return ListView.builder(
      itemCount: 30,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext con,int index){  

        int num1 = index%2;
        Color col = (num1 == 0) ? Colors.blue : Colors.orange;
        return Container(
           width: 100,
           height: 50,
           alignment: Alignment.center,
           color: col,
          //  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
           child: Container(
             color: Colors.green,
             child: Text('$index'),
           ),
        );
      },
    );
  }

  setupWrap() {
    return 
    // Container(

    //   width:  ScreenWidth,
    //   height: 400,
    //   color: Colors.orange,
    //   child:
        Wrap(
       alignment: WrapAlignment.center,
       crossAxisAlignment: WrapCrossAlignment.start,
      //  runAlignment: WrapAlignment.start,
       spacing: 20,
       runSpacing: 30,
       children: <Widget>[
         Container(
            width: 100,
            height: 70,
            color: Colors.blue,
         ),
         Container(
            width: 100,
            height: 50,
            color: Colors.red,
         ),
         Container(
            width: 100,
            height: 50,
            color: Colors.blue,
         ),
         Container(
            width: 100,
            height: 50,
            color: Colors.red,
         ),
         Container(
            width: 100,
            height: 50,
            color: Colors.blue,
         ),
         RaisedButton(
           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
           child: Container(
            width: 100,
            height: 50,
            color: Colors.red,
           ),
            onPressed: (){
              print('12323232');
            },
         ),
       ],
     );
    // );
  }

  setupStack() {
    return Container(
      width: ScreenWidth,
      height: 350,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            color: Colors.orange,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          )
        ],
      ),
    );
  }

  setupConBox() {
     return Container(
      width: 300,
      height: 300,
      color: Colors.green,
      alignment: Alignment.center,
      child: SizedBox(
        // width: 100,
        // height: 100,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
        ),
      ),
     );
  }

  setupFractionallySizedBox() {

    return Container(
       width:  100,
       height: 100,
       color: Colors.blue,
       alignment: Alignment.center,
      //  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
       child: FractionallySizedBox(
         widthFactor: 2,
         heightFactor: 0.5,
         alignment: Alignment.centerLeft,
         child: Container(
           color: Colors.orange,
         ),
       ),
    );
  }

  setupIndexedStack() {
    return Container(
       width: ScreenWidth,
       height: 400,
       color: Colors.blue,
       child: IndexedStack(
        index: showIndex,
         children: <Widget>[
           Container(
             width: 200,
             height: 200,
             color: Colors.orange,
             child: RaisedButton(
               child: Text('1',style: TextStyle(color: Colors.orange),),
                onPressed: (){
                  showIndex = 1;
                  setState(() {
                    
                  });
                },
             ),
           ),
           Container(
            width: 100,
            height: 100,
            color: Colors.green,
             child: RaisedButton(
               child: Text('2'),
                onPressed: (){
                  showIndex = 0;
                  setState(() {
                    
                  });
                },
             ),
           ),
         ],
       ),
    );
  }

  setupGird() {

  Future.delayed(Duration(seconds: 1),(){
      this.widget.eve.fire('第二个页面');
      var t = this.widget.eve.runtimeType;
       wid = Builder(
        builder: (context){
          return Text('13213');
        },
      );
  });

    return Container(
      height: ScreenWidth,
      width: ScreenWidth,
      color: Colors.blue,
      alignment: Alignment.center,
      child: GridView.count(
          childAspectRatio: 1,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          children: List.generate(100, (int index){
            Color col = (index%2 == 0) ? Colors.orange : Colors.green;
              return Container(
                // width: ScreenWidth,
                alignment: Alignment.center,
                height: 100,
                color: col,
                child: Builder(
                  builder: (context){
                    Future.delayed(Duration(seconds: 1),(){
                      print('子页面加载啦~~~');
                        // NotificationCuston('666',parm: {'111':1}).dispatch(context);

                    });
                    return Text('$index');
                  },

                ),
              );
          }
        )
      ),
    );
  }

}