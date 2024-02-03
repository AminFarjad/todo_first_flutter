import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const Lists(title: 'Todo page'),
    );
  }
}

class Lists extends StatefulWidget {
  const Lists({super.key,required this.title});
  final String title;
  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  final List<String> todo_lists=[];
  
  final textFieldController=TextEditingController();
  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(widget.title),centerTitle: true,),
      body: Column(children: [Padding(padding: EdgeInsets.all(12),child: TextField(controller: textFieldController,)),ElevatedButton(onPressed: (){
        setState(() {
          todo_lists.add(textFieldController.text);
        });
        textFieldController.text='';
        log(todo_lists.toString(),);
      }, child: Text('Add Item'),),
      Expanded(child: ListView.builder(itemCount: todo_lists.length,itemBuilder: (context,index)=>ListTile(title: Text(todo_lists[index]),))),],
      
      ),
    );
  }
}