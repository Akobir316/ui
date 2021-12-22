import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Messages'),
    );
  }
}
