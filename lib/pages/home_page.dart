import 'package:flutter/material.dart';
import 'package:todolist_app/constants/colors.dart';
import 'package:todolist_app/model/todo.dart';
import 'package:todolist_app/widgets/mySearchBox.dart';
import 'package:todolist_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = ToDo.todoList();
  List<ToDo> findToDo = [];
  final todoCreate = TextEditingController();

  @override
  void initState() {
    findToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wrnaBG,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: wrnaHitam,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
        title: const Text("ToDo App", style: TextStyle(color: wrnaHitam)),
        centerTitle: true,
        backgroundColor: wrnaBG,
        actions: const <Icon>[
          Icon(
            Icons.person,
            color: wrnaHitam,
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: <Widget>[
                MySearchBox(
                    hint: "Cari something ...",
                    onChanged: (value) {
                      setState(() {
                        searchFilter(value!);
                      });
                    }),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          'Semua Kegiatan',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (ToDo todo in findToDo.reversed)
                        ToDoItem(
                          todoo: todo,
                          onToDoChanged: handleToDoChange,
                          onDeleteItem: deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: wrnaPutih,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: todoCreate,
                      decoration: const InputDecoration(
                          hintText: 'Tambahkan kegiatan baru',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: const Text(
                      '+',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      addToDoItem(todoCreate.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: wrnaBiru,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void searchFilter(String keyword) {
    List<ToDo> result = [];
    if (keyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((element) =>
              element.todoText.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      findToDo = result;
    });
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void addToDoItem(String todo) {
    setState(() {
      setState(() {
        todoList.add(ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: todo));
      });
    });
    todoCreate.clear();
  }

  void deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }
}
