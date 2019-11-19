
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomwList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomwListState();
  }

}

class HomwListState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
       appBar: AppBar(
         title: Text("详情"),
       ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("目录"),),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context,index){
                  return ListTile(title: Text("$index"),);
              },
            ),
          ),
        ],
      ),
    );

  }

}