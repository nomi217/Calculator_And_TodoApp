import 'package:cal_todo_app/calculatorapp.dart';
import 'package:cal_todo_app/todoapp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Calculator and TodoApp'),
          ),
          actions: [Icon(Icons.more_vert)],
          bottom: TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(
                  Icons.calculate,
                  size: 20,
                ),
                text: 'Calculator',
              ),
              Tab(
                icon: Icon(
                  Icons.notes,
                  size: 20,
                ),
                text: 'Todo App',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [CalculatorApp(), TodoApp()],
        ),
      ),
    );
  }
}
