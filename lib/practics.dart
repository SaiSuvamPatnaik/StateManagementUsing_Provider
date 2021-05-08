import 'package:flutter/material.dart';
import 'package:provide/timer_info.dart';
import 'package:provider/provider.dart';

class practice extends StatefulWidget {
  @override
  _practiceState createState() => _practiceState();
}

class _practiceState extends State<practice> {
  String age;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligiblityScreenProvider>(
      create: (context) => EligiblityScreenProvider(),
      child: Builder(
        builder: (context){
          return Scaffold(
            appBar: AppBar(
              title: Text("TESTING"),
            ),
            body: Center(
              child: Container(
                child: Consumer<EligiblityScreenProvider>(
                  builder: (context,data,child){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: (data.iseligible1()==null)?Colors.black:data.iseligible1()?Colors.green:Colors.red,
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,5,15,5),
                          child: TextField(

                            style: TextStyle(fontSize: 20,color: Colors.black),
                            decoration: InputDecoration(
                              labelText: ("Enter Age"),
                              prefixIcon: Icon(Icons.person,size: 30,color: Colors.blueAccent,),

                            ),
                            onChanged: (text){
                              age=text;
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,5,15,5),
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            child: FlatButton(
                              child: Text("Check"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: (){
                                  age==null?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Age")))
                                      :data.checkEligiblity(int.parse(age));
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        age==null?Text("Enter Age",style: TextStyle(fontSize: 17),):
                        Text(data.eligiblityMessage1(),style: TextStyle(fontSize: 17),)
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
