import 'package:flutter/material.dart';
import 'package:movies_app/home/home_page.dart';
import 'package:movies_app/movie/movie_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xff111820),
      ),
      home: HomePage(),
    );
  }
}
