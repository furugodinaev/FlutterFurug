import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // to change your app color change this
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text(
            'Flower Shop',
            style: TextStyle(fontFamily: 'casual'),
          ),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            flowerDetails(context),
          ],
        ));
  }
}


Widget flowerDetails(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        imageGroup(),
        titleGroup(),
        iconGroup(),
        textGroup(),
        buttonGroup(),
      ],
    ),
  );
}

/// Image URL
/// https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg

Widget imageGroup() {
  return Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(8),
    child:
    Stack(
      children: [
        Image.network("https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg",
            fit: BoxFit.cover)
      ],
    ),
  );
}
Widget titleGroup() {
  return Container(
      padding: EdgeInsets.only(top: 16, bottom: 8),
      child:
      ListTile(
        title: const Text("Sunny Flowers", style: TextStyle(
          fontSize: 47,
          color: Colors.black,
          fontFamily: 'cursive',
        ),),
        subtitle: const Text("12 dosen", style: TextStyle(
            fontSize: 14,
            color: Colors.black54
        ),),
      )
  );
}

Widget iconGroup() {
  return Container(
      padding: EdgeInsets.all(10),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.share, color: Colors.indigo, size: 40),
          Icon(Icons.favorite, color: Colors.indigo, size: 40)
        ],
      )
  );
}
/// here is the text to copy
///Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
Widget textGroup() {
  return Container(
      padding: EdgeInsets.only(top: 16, bottom: 8),
      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', style: TextStyle(
          fontSize: 14,
          fontFamily: 'casual'
      ))
  );
}

Widget buttonGroup() {
  return Container(
    //padding: EdgeInsets.all(10),
      child:
      ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            Text("    ADD TO CART", style: TextStyle(color: Colors.white),)
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          minimumSize: Size(900, 50),
          onPrimary: Colors.amber,
          animationDuration: Duration(milliseconds: 1000),
          primary: Colors.indigo,
          padding: EdgeInsets.only(top: 13, bottom: 13, right: 79, left: 100),
        ),
        onPressed: (){
          print("hi");
        },
      )

  );
}