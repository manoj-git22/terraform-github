import 'package:Todo_v2/models/TaskModel.dart';
import 'package:Todo_v2/screens/PriorityViewPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriorityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = Provider.of<TaskModel>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.all(10),
      child: Row(
          children: t.prioritylist
              .map(
                (e) => Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PriorityViewPage(e),
                        )),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      color: e == 'High'
                          ? Colors.red
                          : e == 'Medium' ? Colors.amber : Colors.green,
                      child: Center(
                          child: Text(e,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
