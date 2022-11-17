import 'package:Todo_v2/models/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class InformationWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t5 = Provider.of<TaskModel>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        height: 70,
        width: 50,
        child: Card(
          borderOnForeground: false,
          elevation: 10,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Container(
                  height: double.maxFinite,
                  width: 180,
                  child: Column(
                    children: [
                      Container(
                          height: 40,
                          width: double.maxFinite,
                          child: Center(
                              child: Text(
                            t5.completedlist.length.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'NunitoSans',
                                color: Colors.teal),
                          ))),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                  height: double.maxFinite,
                  width: 180,
                  child: Column(
                    children: [
                      Container(
                          height: 40,
                          width: double.maxFinite,
                          child: Center(
                              child: Text(
                            (t5.tasklist.length - t5.completedlist.length)
                                .toString(),
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'NunitoSans',
                                color: Colors.redAccent),
                          ))),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Pending',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
