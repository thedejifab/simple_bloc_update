import 'package:flutter/material.dart';
import 'provider.dart';
import 'model.dart';
import 'bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TextProvider(
      myTextBloc: MyTextBloc(Utils()), //allows access to the BLoC from any part of the widget tree
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});

  Widget build(BuildContext context) {
    final myTextBloc = TextProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: myTextBloc.initialText.add, //to send the value to the Sink as the user is typing
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter text to reverse",
              ),
            ),
          ),
          StreamBuilder(
            stream: myTextBloc.log,
            builder: (context, snapshot) => Container(
              child: Text(snapshot?.data ?? " "),
            ),
          ),
          StreamBuilder(
            stream: myTextBloc.result,
            builder: (context, snapshot){
              if(!snapshot.hasData){ 
                return Center(
                  child: CircularProgressIndicator(), //if user types nothing
                );                
              }
              return Text(snapshot.data); //to retrieve reversed string via streams
            },
          )
        ],
      ),
    );
  }
}
