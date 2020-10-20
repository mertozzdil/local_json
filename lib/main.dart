import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LOCAL JSON",
      home: LocalJson(),
    );
  }
}

class LocalJson extends StatefulWidget {
  @override
  _LocalJsonState createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {

  List students;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Local Json", style: TextStyle(fontSize: 25.0)), centerTitle: true, backgroundColor: Colors.blueAccent),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("lib/data/students.json"),
            builder: (context, snapshot){
              students = json.decode(snapshot.data.toString());
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("Adı : ${students[index]["firstName"]}", style: TextStyle(fontSize: 19.0)),
                          Text("Soyadı : ${students[index]["lastName"]}", style: TextStyle(fontSize: 19.0)),
                          Text("Numarası : ${students[index]["number"]}", style: TextStyle(fontSize: 19.0)),
                          Text("Veli Tel No : ${students[index]["parents"]["telephone"]}", style: TextStyle(fontSize: 19.0))
                        ],
                      ),
                    );
                  },
                  itemCount: students == null ? 0 : students.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
