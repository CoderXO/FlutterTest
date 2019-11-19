

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cc_uitest/Tool/Tool.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'MyViewModel.dart';

class MyController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyControllerState();
  }
  
}

class MyControllerState extends State<MyController> {
  @override

  MyViewModel dateSoure = MyViewModel();
  RefreshController refreshVC = RefreshController(initialRefresh: false,initialLoadStatus: LoadStatus.idle,initialRefreshStatus: RefreshStatus.idle);
  int cellNum = 3;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
        backgroundColor: Colors.green,
      ),
      body: setupRefreshTableView(context,refreshVC),
    );
  }

  setupRefreshTableView(BuildContext con,RefreshController conVC) {

      ListView list = setupTableView(con);
      return refreshTableView(list, con, conVC,
      callBack: (LoadStatus statu) {
          refreshTableViewCallback(statu, conVC);
      });
  }

  refreshTableViewCallback(LoadStatus state,RefreshController conVC) async {
      // var model =  conVC.headerMode;
      // var model1 = conVC.footerMode;
      // print('刷新状态:$state===$model===$model1');
     

      if(state == LoadStatus.loading){
      
            await  Future.delayed(Duration(milliseconds: 2000),(){
                   cellNum += 5;

                  setState(() {
                    
                  });
                   conVC.loadComplete();
                   print('加载完成');
            });
  
          }

          if(state == LoadStatus.idle){
            await  Future.delayed(Duration(seconds:2),(){
            setState(() {
              cellNum = 3;
            });
            conVC.refreshCompleted();
            print('刷新闲置');
            });
       
                  // conVC.refreshCompleted();
                  //           print('刷新闲置');
  
          }
  }

  setupTableView(BuildContext con) {
    return ListView.separated(
        itemCount: cellNum,
        itemBuilder: (con, index) {
            return Padding(
              child: Text('$index\n适用场景：长列表时采用builder模式，能提高性能。不是把所有子控件都构造出来，而是在控件viewport加上头尾的cacheExtent这个范围内的子Item才会被构造。在构造时传递一个builder，按需加载是一个惯用模式，能提高加载性能'),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            );
        },
        separatorBuilder: (con,index) {
          return Container(
            height: 0.5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                color: Colors.black26,
              ),
            ),
          );
        },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    refreshVC.dispose();
    super.dispose();

  }
  
}