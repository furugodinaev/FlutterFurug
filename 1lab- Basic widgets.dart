import 'package:flutter/material.dart';

void main() => runApp(Lab1());

/// this is your APP Main screen configuration
class Lab1 extends StatelessWidget {
  Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAb1HomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class LAb1HomePage extends StatelessWidget {
  LAb1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.deepPurple,
        splashColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.indigoAccent,
        child: SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Bottom Navigation Bar",
                style: TextStyle(color: Colors.white, fontSize: 30, )
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: Icon(Icons.menu),
        title: Text("Lab 1 Bonus"),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 16,
          ),
          Icon(Icons.settings),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.favorite),
          SizedBox(
            width: 16,
          ),
          Icon(Icons.edit),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: myWidget(),
      ),
    );
  }

  Widget myWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          /*******************--[focus here 🧐]--*******************/
          SizedBox(
            height: 25,
          ),
          exercise1(),
          SizedBox(
            height: 25,
          ),
          exercise2(),
          SizedBox(
            height: 25,
          ),
          exercise3(),
          SizedBox(
            height: 25,
          ),
          exercise4(),
          SizedBox(
            height: 25,
          ),
          exercise5(),
          SizedBox(
            height: 25,
          ),
          exercise6(),
          /*******************--[focus here 🧐]--*******************/
        ],
      ),
    );
  }

  /// TODO: Implement Exercises below as per the handed Document
  Widget exercise1() {
    return Text('Welcome to lab 1',
        style: TextStyle(
            backgroundColor: Colors.grey,
            color: Colors.greenAccent,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontFamily: "monospace"));
  }

  Widget exercise2() {
    return Icon(
      Icons.share,
      size: 120,
      color: Colors.blueAccent,
    );
  }

  /// TODO : print on the screen on Pressed when clicking on the button, and print on Long Pressed when long click to Button
  Widget exercise3() {
    return ElevatedButton(
      onPressed: () {
        print("on Pressed");
      },
      child: Text("Click here",
          style: TextStyle(color: Colors.amberAccent, fontSize: 20)),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigoAccent,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60)),
      onLongPress: () {
        print("Long Pressed");
      },
    );
  }

  Widget exercise4() {
    return ElevatedButton(
      onPressed: () {
        print("on Pressed");
      },
      child: Icon(Icons.favorite, color: Colors.greenAccent, size: 50),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          elevation: 10),
    );
  }

  Widget exercise5() {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        "Button to press",
        style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20),
      ),
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          side: BorderSide(color: Colors.amber, width: 3)),
    );
  }

  Widget exercise6() {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: Colors.amberAccent,
          border: Border(
              left: BorderSide(color: Colors.indigoAccent, width: 10),
              right: BorderSide(color: Colors.deepPurple, width: 10),
              bottom: BorderSide(color: Colors.red, width: 10),
              top: BorderSide(color: Colors.blue, width: 10))),
      child: Icon(Icons.warning, size: 60),
    );
  }
}
