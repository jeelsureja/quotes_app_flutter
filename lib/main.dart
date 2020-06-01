import 'package:flutter/material.dart';
import 'package:quotes_app/ui/pages/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp() : super();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: SplashScreen(),
        )
      )
    );
  }
}