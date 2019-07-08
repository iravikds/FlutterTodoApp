import 'package:flutter/material.dart';
import 'package:todo_list_app/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Todo App',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: TodoList(),
    );
  }
}