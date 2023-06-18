import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
              accentColor: Colors.blueGrey)),
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

  var isPressed = false;
  List<Post> names = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, AddPostScreen.getRoute(context));
          },
          child: Icon(Icons.add_comment_sharp),
        ),
        body: isPressed == false ? buildEmptyView() : createListView()
    );
  }


  Future<List<Post>> getPosts() async {
    List<Post> usersList =[];
    Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((json) {
        usersList.add(Post.fromJson(json));
      });
      return usersList;
    }
    return [];
  }


  Widget buildEmptyView() {
    return FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            names = snapshot.data!;
            return Center(
              child: ElevatedButton(onPressed: (){
                setState(() {
                  getPosts();
                  isPressed = true;
                });
              }, child: Text('press me')),
            );
            //createListView();
          }

          return Center(child: CircularProgressIndicator());
        });
  }


  Widget createListView() {
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.comment_rounded),
                title: Text("${names[index].title}",style: TextStyle(fontSize: 18),),
                subtitle: Text("${names[index].body}"),
              ),
              Divider()
            ],
          );
        });
  }
}

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}

class AddPostScreen extends StatefulWidget {
  static getRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionsBuilder: (_, animation, secondAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }, pageBuilder: (_, __, ___) {
      return new AddPostScreen();
    });
  }

  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController titleController = TextEditingController(text: 'test title');
  TextEditingController commentController = TextEditingController(text: 'comment');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new user'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                filled: true,
                hintText: 'write title here...',
                labelText: 'title ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              maxLines: 5,
              controller: commentController,
              decoration: const InputDecoration(
                icon: Icon(Icons.comment),
                filled: true,
                hintText: 'write Comment here',
                labelText: 'Comment',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  addComment(title: titleController.text, comment: commentController.text);
                },
                child: Text("Add Comment".toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addComment({
    required String title,
    required String comment,
  })
  async {
    var response =
    await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode({
          "title": "$title",
          "body": "$comment",
          "userId": 1,
        }));

    //print(response.body);
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Comment Added')));
    } else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error ${response.body}')));
  }
}
