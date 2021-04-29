import 'package:flutter/material.dart';
import 'package:movies_app/home/widgets/category_widgets.dart';
import '../utils/app_text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text('Movies', style: AppTextStyles.title),
      ),
      body: CategoryWidget(),
    );
  }
}
