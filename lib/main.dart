import 'dart:convert';

import 'package:api_learning/model/getData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}
String url = "https://api.github.com/users/Engineeremir";
var Url = Uri.https('api.github.com', '/users/Engineeremir');
Future<GetData> apiCall() async {
  final response = await http.get(Url);
  if (response.statusCode == 200) {
    return GetData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetData>(
        future: apiCall(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                child: Text("username: ${snapshot.data!.login} \n" +
                    "id: ${snapshot.data!.id}\n" + "name:  ${snapshot.data!.name}"),
              ),
            );
          }
          return Container();
        }

      ),
    );
  }
}
