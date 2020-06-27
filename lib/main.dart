import 'dart:io';

import 'package:flutter/material.dart';
import 'package:passtime/Snake.dart';
import 'package:passtime/Tetris.dart';
import 'package:passtime/Tic.dart';
import 'package:passtime/sudoku.dart';

import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'PASS TIME'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff003399),
        appBar: AppBar(
          backgroundColor: Color(0xff003399),
          title: Center(
              child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: 'BlackOpsOne'),
          )),
          actions: [
            FlatButton(
                onPressed: () {
                  exit(0);
                },
                child: Image.asset("assets/images/close.jpg"))
          ],
        ),
        drawer: SizedBox(
          width: 75.0,
          child: Drawer(
            child: Row(
              children: [
                NavigationRail(
                  backgroundColor: Color(0xff0061fc),
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  groupAlignment: 1.0,
                  labelType: NavigationRailLabelType.all,
                  leading: Column(
                    children: <Widget>[
//                  CircleAvatar(
//                    backgroundImage: AssetImage(''),
//                  ),
//                      SizedBox(height: 20),
                    ],
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: RaisedButton(
                              padding: EdgeInsets.all(1),
                              child: Text(
                                "Home",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xffdb3c07),
                              elevation: 1.0,
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: RaisedButton(
                                padding: EdgeInsets.all(1),
                                child: Text(
                                  "Snake",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.redAccent,
                                elevation: 1.0,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Snake()))),
                          ),
                        )),
                    NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: RaisedButton(
                                padding: EdgeInsets.all(1),
                                child: Text(
                                  "Tic Tac Toe",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.redAccent,
                                elevation: 1.0,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Tic()))),
                          ),
                        )),
                    NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: RaisedButton(
                                padding: EdgeInsets.all(1),
                                child: Text(
                                  "Tetris",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.redAccent,
                                elevation: 1.0,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Tetris()))),
                          ),
                        )),
                    NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: RotatedBox(
                          quarterTurns: -1,
                          child: RaisedButton(
                              padding: EdgeInsets.all(1),
                              child: Text(
                                "Sudoku",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.redAccent,
                              elevation: 1.0,
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sudoku()))),
                        )),
                    NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: RotatedBox(
                          quarterTurns: -1,
                          child: FlatButton(
                              padding: EdgeInsets.all(1),
                              child: Image.asset("assets/images/close.jpg"),
                              onPressed: () => exit(0)),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        body: HomePage());
  }
}