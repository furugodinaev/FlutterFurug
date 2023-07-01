//import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool onTap = false;
  bool isCircle = true;
  int logogStatus = 0;
  int animation = 1;
  bool locked = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Lab 3',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 450),
        width: screenWidth,
        height: onTap == false ? screenHeight : 60,
        // to 0 when click on it, to screen height when also click on it
        color: Colors.indigo,
        child: Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (onTap == false) {
                      onTap = true;
                    } else {
                      onTap = false;
                    }
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      'Click to Expand',
                      style: TextStyle(fontSize: 18),
                    )),
                    Icon(Icons.keyboard_arrow_up),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    changeShapes(screenWidth),
                    flutterChanger(screenWidth),
                    showHide(screenWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeShapes(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          width: width,
          height: 150,

          /// ********** Do changes in child below ********** ///
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isCircle = !isCircle;
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: isCircle == false
                        ? RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )
                        : CircleBorder(),
                    backgroundColor:
                        isCircle == true ? Colors.blue : Colors.red,
                    padding: EdgeInsets.all(24)),
                child: null,
              ),
              new Text(' '),
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isCircle = !isCircle;
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: isCircle == true
                        ? RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )
                        : CircleBorder(),
                    backgroundColor:
                        isCircle == false ? Colors.blue : Colors.red,
                    padding: EdgeInsets.all(24)),
                child: null,
              ),
              new Text(' '),
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
              )
            ],
          ),
        ),
      ),
    );
  }

  FlutterLogoStyle GetLogoStyle(int logogStatus) {
    if (logogStatus == 0) {
      return FlutterLogoStyle.markOnly;
    }
    if (logogStatus == 1) {
      return FlutterLogoStyle.horizontal;
    }
    if (logogStatus == 2) {
      return FlutterLogoStyle.stacked;
    } else {
      return FlutterLogoStyle.markOnly;
    }
  }

  Widget flutterChanger(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          width: width,
          height: 150,

          /// ********** Do changes in child below ********** ///
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterLogo(
                style: GetLogoStyle(logogStatus),
                size: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (logogStatus == 2) {
                      logogStatus = 0;
                    } else {
                      logogStatus++;
                    }
                    print(logogStatus);
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(10),
                ),
                child: Icon(Icons.change_circle_outlined, size: 50),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showHide(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          width: width,
          height: 150,

          /// ********** Do changes in child below ********** ///
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Opacity(
                  opacity: locked == true ? 0 : 1,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: new Icon(Icons.favorite_sharp,
                        color: Colors.red, size: 80),
                  )),
              new Text('    '),
              IconButton(
                onPressed: () {
                  setState(() {
                    locked = !locked;
                  });
                },
                icon: locked == true
                    ? Icon(
                        Icons.lock,
                        color: Colors.deepPurpleAccent,
                        size: 70,
                      )
                    : Icon(
                        Icons.lock_open,
                        color: Colors.deepPurpleAccent,
                        size: 70,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
