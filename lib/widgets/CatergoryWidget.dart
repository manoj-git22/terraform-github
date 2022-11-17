import 'package:Todo_v2/models/TaskModel.dart';
import 'package:provider/provider.dart';
import '../screens/CategoryViewPage.dart';
import 'package:flutter/material.dart';

class CatergoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t3 = Provider.of<TaskModel>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width * 1,
      color: Colors.blueGrey[100],
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String id = t3.categorylist[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  String title = t3.categorylist[index];
                  return CategoryViewPage(title);
                }));
              },
              child: Container(
                child: Card(
                  shadowColor: Colors.blueGrey,
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 130,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Text(
                            t3.categorylist[index],
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                          child:
                              id == 'Home' || id == 'Personal' || id == 'Work'
                                  ? id == 'Work'
                                      ? Icon(Icons.work)
                                      : id == 'Home'
                                          ? Icon(Icons.home)
                                          : Icon(Icons.person_outline)
                                  : IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red[600],
                                      ),
                                      onPressed: () {
                                        t3.deletecategory(id);
                                        t3.removeCategoryTask(id);
                                      }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: t3.categorylist.length,
      ),
    );
  }
}
