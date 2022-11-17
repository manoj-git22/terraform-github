import 'package:Todo_v2/models/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PriorityViewPage extends StatelessWidget {
  final String priority;
  PriorityViewPage(this.priority);
  @override
  Widget build(BuildContext context) {
    var t = Provider.of<TaskModel>(context);
    var templist =
        t.tasklist.where((element) => element.priority == priority).toList();
    var complist =
        templist.where((element) => element.isCompleted == true).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(priority),
        backgroundColor: priority == 'High'
            ? Colors.red
            : priority == 'Medium' ? Colors.amber : Colors.green,
      ),
      body: templist.length > 0
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: templist.length > 0
                      ? LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.teal),
                          value: complist.length / templist.length,
                        )
                      : null,
                ),
                Text(templist.length > 0
                    ? complist.length.toString() +
                        '/' +
                        templist.length.toString()
                    : ''),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      String id = templist[index].id;
                      return ListTile(
                          leading: Checkbox(
                            activeColor: Colors.teal,
                            value: templist[index].isCompleted,
                            onChanged: (value) {
                              t.completed(id);
                            },
                          ),
                          title: Text(t.tasklist[index].title),
                          subtitle: Text(templist[index].date == null
                              ? ''
                              : DateFormat.MMMMEEEEd()
                                  .format(templist[index].date)),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => t.removeTask(id)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusColor: Colors.pink);
                    },
                    itemCount: templist.length,
                  ),
                ),
              ],
            )
          : Center(
              child: Text('You have no tasks'),
            ),
    );
  }
}
