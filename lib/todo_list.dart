import 'package:flutter/material.dart';
import 'package:todo_list_app/todo.dart';

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  List<Todo> todos = [];

  TextEditingController controller = new TextEditingController();

  toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New todo'),
          content: TextField(
            controller: controller,
            autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  final todo = new Todo(title: controller.value.text);
                  todos.add(todo);
                  controller.clear();
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }

  Widget buildItem(BuildContext context, int index) {
    final todo = todos[index];

    // return CheckboxListTile(
    //   value: todo.isDone,
    //   title: Text(
    //     todo.title,
    //     style: todo.isDone
    //         ? TextStyle(
    //             color: Colors.grey, decoration: TextDecoration.lineThrough)
    //         : TextStyle(color: Colors.black),
    //   ),
    //   onChanged: (bool isChecked) {
    //     toggleTodo(todo, isChecked);
    //   },
    // );

    return Card(
      elevation: 2.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(color: Color.fromRGBO(241, 196, 15, 1.0)),
        child: CheckboxListTile(
          value: todo.isDone,
          title: Text(
            todo.title,
            style: todo.isDone
                ? TextStyle(
                    color: Colors.grey, decoration: TextDecoration.lineThrough)
                : TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onChanged: (bool isChecked) {
            toggleTodo(todo, isChecked);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
        backgroundColor: Color.fromRGBO(243, 156, 18, 1.0),
        elevation: 0.1,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(243, 156, 18, 1.0),
      body: ListView.builder(
        itemBuilder: buildItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addTodo();
        },
      ),
    );
  }
}
