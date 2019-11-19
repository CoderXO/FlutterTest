

import 'package:cc_uitest/Tool/Tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseFulController extends StatefulWidget {
    String name = '1321321';
}

@optionalTypeArgs
abstract class BaseState<T extends StatefulWidget> extends State {

  int age = 10;
  @override
  void initState() {
    // TODO: implement initState
    print('年龄:$age');
  }
}



class DisController extends BaseFulController {
  
  @override
  State<StatefulWidget> createState() {
    name = '666';
    // TODO: implement createState
    return DisControllerState();
  }
  
}


class DisControllerState extends BaseState<DisController> {

String name = '555';

@override
  void initState() {
    // TODO: implement initState
    print('222222');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('12321321'),
      ),
      body: Text('132312321'),
    );
  }

}

