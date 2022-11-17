import 'package:Todo_v2/models/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CategoryViewPage extends StatelessWidget {
  final String id;

  CategoryViewPage(
    this.id,
  );
  @override
  Widget build(BuildContext context) {
    var t4 = Provider.of<TaskModel>(context);
    var templist =
        t4.tasklist.where((element) => element.category == id).toList();
    var complist =
        templist.where((element) => element.isCompleted == true).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(id),
      ),
      body: templist.length > 0
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('Progress'),
                ),
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
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      String id = templist[index].id;
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Material(
                          color: Colors.white,
                          child: ListTile(
                              leading: Checkbox(
                                  value: templist[index].isCompleted,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    t4.completed(id);
                                  }),
                              title: Text(templist[index].title),
                              subtitle: templist[index].date != null
                                  ? Text(DateFormat.MMMMEEEEd()
                                      .format(templist[index].date))
                                  : Text(''),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => t4.removeTask(id),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusColor: Colors.pink),
                        ),
                      );
                    },
                    itemCount: templist.length,
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
              'You have no tasks',
              style: TextStyle(fontSize: 17),
            )),
    );
  }
}
