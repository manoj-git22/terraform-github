import 'package:Todo_v2/models/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTaskWidget extends StatefulWidget {
  @override
  _HomeTaskWidgetState createState() => _HomeTaskWidgetState();
}

class _HomeTaskWidgetState extends State<HomeTaskWidget> {
  @override
  Widget build(BuildContext context) {
    var t1 = Provider.of<TaskModel>(context);
    var templist = t1.tasklist;

    return templist.length > 0
        ? Container(
            height: MediaQuery.of(context).size.height * 0.38,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemBuilder: (context, indexer) {
                String id = templist[indexer].id;

                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Material(
                    color: Colors.white,
                    child: ListTile(
                        leading: Checkbox(
                          activeColor: Colors.teal,
                          value: templist[indexer].isCompleted,
                          onChanged: (value) {
                            t1.completed(id);
                          },
                        ),
                        title: Text(t1.tasklist[indexer].title),
                        subtitle: Text(templist[indexer].date == null
                            ? ''
                            : DateFormat.MMMMEEEEd()
                                .format(templist[indexer].date)),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => t1.removeTask(id)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusColor: Colors.pink),
                  ),
                );
              },
              itemCount: templist.length,
            ),
          )
        : Center(
            child: Padding(
            padding: const EdgeInsets.all(85),
            child: Text('You have no tasks left'),
          ));
  }
}
