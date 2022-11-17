import 'package:Todo_v2/Widgets/CatergoryWidget.dart';
import 'package:Todo_v2/Widgets/HomeTaskWidget.dart';
import 'package:Todo_v2/models/TaskModel.dart';
import 'package:Todo_v2/widgets/HeaderWidget.dart';
import 'package:Todo_v2/widgets/PriorityWidget.dart';
import './Widgets/InfoWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Widgets/FloaterWidget.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskModel(),
    child: Taskapp(),
  ));
}

class Taskapp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              CatergoryWidget(),
              InformationWiget(),
              PriorityWidget(),
              HomeTaskWidget()
            ],
          ),
        ),
        floatingActionButton: Floater());
  }
}
