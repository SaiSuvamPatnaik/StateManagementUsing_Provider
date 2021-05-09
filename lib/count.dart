import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provide/connection.dart';
import 'package:provide/countmodel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';

class count extends StatefulWidget {
  @override
  _countState createState() => _countState();
}

class _countState extends State<count> {
  @override
  Widget build(BuildContext context) {
    connection checking = new connection();
    print("SSP");
    return ChangeNotifierProvider<countmodel>(
      create: (context) => countmodel(),
      child: Builder(
        builder: (context){
          return Consumer<countmodel>(
            builder: (context,data,child){
              return Scaffold(
                appBar: AppBar(
                  title: Text("COUNT"),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.countervalvalue().toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                      IconButton(icon:Icon(Icons.restore,size: 30,),onPressed: (){
                        data.reset();
                      }),
                      FutureBuilder(
                          future: connection().checknet(),
                          builder: (context,snapshot){
                            return snapshot.data==null?Text("Loading ...",style: TextStyle(fontSize: 30),)
                                :Text(snapshot.data,style: TextStyle(fontSize: 30),);
                          }),
                      FutureBuilder(
                          future: connection().check(),
                          builder: (context,snapshot){
                            return snapshot.data==null?Text("Loading ...",style: TextStyle(fontSize: 30),)
                                :Text(snapshot.data.toString(),style: TextStyle(fontSize: 30),);
                          }),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: (){
                    data.increament();
                  },
                  child: Icon(Icons.add),
                ),
              );
            },
          );
        },
      )
    );
  }
}
