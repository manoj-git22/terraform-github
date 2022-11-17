import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:provider/provider.dart';
import '../models/TaskModel.dart';
import 'package:intl/intl.dart';

class Floater extends StatefulWidget {
  @override
  _FloaterState createState() => _FloaterState();
}

class _FloaterState extends State<Floater> {
  DateTime selectedDate;
  String selectedCategory;
  String selectedPriority;
  TextEditingController catcontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var t2 = Provider.of<TaskModel>(context);
    return UnicornDialer(
      parentHeroTag: 'parenttag',
      hasBackground: false,
      parentButton: Icon(Icons.add),
      parentButtonBackground: Colors.black,
      childButtons: [
        UnicornButton(
          currentButton: FloatingActionButton(
            heroTag: 'tasktag',
            mini: true,
            onPressed: () {
              {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Dialog(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 300,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextField(
                                controller: titlecontroller,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    labelText: 'Task Name',
                                    labelStyle:
                                        TextStyle(color: Colors.redAccent)),
                              ),
                              DropdownButton(
                                items: t2.categorylist.map((cat) {
                                  return DropdownMenuItem(
                                      value: cat, child: Text(cat));
                                }).toList(),
                                value: selectedCategory,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCategory = value;
                                  });
                                },
                                hint: Text('Select Category'),
                              ),
                              DropdownButton(
                                items: t2.prioritylist.map((e) {
                                  return DropdownMenuItem(
                                      value: e, child: Text(e));
                                }).toList(),
                                value: selectedPriority,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPriority = value;
                                  });
                                },
                                hint: Text('Select Priority'),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      showTimePicker(
                                          context: null, initialTime: null);
                                      showDatePicker(
                                          context: context,
                                          currentDate: DateTime.now(),
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now()
                                              .subtract(Duration(days: 30)),
                                          lastDate: DateTime.now().add(
                                            Duration(days: 360),
                                          )).then((value) {
                                        setState(() {
                                          selectedDate = value;
                                        });
                                      });
                                    },
                                  ),
                                  Text(
                                    selectedDate == null
                                        ? 'Reminder'
                                        : DateFormat.MMMMEEEEd()
                                            .format(selectedDate),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                              FlatButton(
                                  onPressed: () {
                                    t2.addtask(
                                        titlecontroller.text,
                                        DateTime.now().toString(),
                                        selectedDate == null
                                            ? DateTime.now()
                                            : selectedDate,
                                        selectedCategory,
                                        selectedPriority);
                                    titlecontroller.clear();
                                    selectedCategory = null;
                                    selectedDate = null;
                                    selectedPriority = null;
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ))
                            ],
                          ),
                        ),
                      );
                    });
                  },
                );
              }
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.check),
          ),
          hasLabel: true,
          labelText: 'Add Task',
        ),
        UnicornButton(
          currentButton: FloatingActionButton(
            heroTag: 'cattag',
            mini: true,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 140,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                            controller: catcontroller,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.redAccent,
                                )),
                                labelText: 'Title',
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 15)),
                          ),
                          FlatButton(
                              onPressed: () {
                                t2.addcategory(catcontroller.text);
                                catcontroller.clear();
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.playlist_add_check),
          ),
          hasLabel: true,
          labelText: 'Add Category',
        )
      ],
    );
  }
}
