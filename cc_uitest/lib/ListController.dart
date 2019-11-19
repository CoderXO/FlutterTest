import 'package:cc_uitest/Tool/Tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cc_uitest/HomeController.dart';
import 'package:cc_uitest/MyController.dart';
import 'package:cc_uitest/MainScrollView.dart';
import 'BaseFulController.dart';
import 'package:event_bus/event_bus.dart';
import 'ShareDateController.dart';
import 'package:cc_uitest/NotificationCenter.dart';

class ListViewController extends StatefulWidget {


  String userName = null;
  String iconName = null;

  ListViewController(this.userName,this.iconName);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewControllerState();
  }
  
}




class ListViewControllerState extends State<ListViewController> with WidgetsBindingObserver,NotificationCallBackMethod{
  

  String numStr = '555';
  EventBus bus = EventBus();
  EventBus eve = EventBus();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("====didChangeDependencies====");
  }
  
 @override
  void notificationCallBack(name, Map parm) {
    // TODO: implement notificationCallBack
    super.notificationCallBack(name, parm);
    print("===通知:$parm");
  }

  @override
  void didUpdateWidget(ListViewController oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("====didUpdateWidget====");
  }

  @override
  void deactivate() {
    var bool = ModalRoute.of(context).isCurrent;
    // TODO: implement deactivate
    super.deactivate();
    print('返回返回');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    NotificationCenter.addObserver(this, "cxl");
    print('初始化');
    eve.on().listen((s){
        print('===========$s');
    });
  }

  setupNot() {
    return Column(
          children: <Widget>[
            Container(
              width: ScreenWidth,
              height: 40,
              color: Colors.orange,
              child: RaisedButton(
                  onPressed: (){
                  
                    setState(() {
                      this.widget.userName = 'BBB';
                      numStr = '7777';
                        // NotificationCuston('iiiii').dispatch(this.context);
                      // print('111');
                    });
                  },
              ),
            ),
            Builder(
              builder: (context){
                return Container(
                    width: 200,
                    height: 44,
                    color: Colors.blue,
                    child: RaisedButton(
                      onPressed: (){
                          
                        // print('1312321');
                        // NotificationCuston('444').dispatch(context);
                      },
                    ),
                );
              },
            )
          ],
        );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive){
    print("====inactive====");
    }

     if(state == AppLifecycleState.resumed){
    print("====resumed====");
    }

    if(state == AppLifecycleState.paused){
    print("====paused====");
    }


    if(state == AppLifecycleState.suspending){
    print("====suspending====");
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.userName),
          backgroundColor: Colors.blue,
          leading: IconButton(
          icon: Icon(Icons.beach_access),
    
          onPressed: () async {
            
            numStr = 'gggggg';
            setState(() {
              
            });
            print('131232321');

            // push(context, MyController());
            //  String s  = await push(context,MainScrollView(this.eve));
             String s  = await push(context,ShareDataController());
        
            // Navigator.pop(context,"陈小乐");
            // Navigator.of(context).pop("CCCCC");

          },
        ),
        ),
        body: setupNot(),
      
    );
  }
  
}

