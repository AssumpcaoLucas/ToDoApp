import 'package:flutter/material.dart';
import 'todo_tile.dart';
import 'pop_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  //Lista do Builder
  List Tasks = [
    ["Fazer App", true],
    ["Fazer um Build", false],
  ];

  //method 1: onSave
  void Salvar(){
    setState(() {
      Tasks.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  //method 2: onCancel
  void Cancelar(){
    Navigator.of(context).pop();
  }
   
  //method 3: buildPopUp
  void click(){
    showDialog(context: context, builder: (context){
      return popUp(
        controller: _controller,
        onCancel: Cancelar,
        onSave: Salvar
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        centerTitle: true,
        title: Text("To Do APP"),
      ),
      backgroundColor: Colors.purple[200],
      body: ListView.builder(
        itemCount: Tasks.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: Tasks[index][0],
            isCheck: Tasks[index][1],
            onChanged: (value){
              setState(() {
                Tasks[index][1] = !Tasks[index][1];
              });
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: click,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        ),
    );
  }
}