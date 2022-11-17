import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 25, 250, 0),
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 45, fontFamily: 'BunchBlossom'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
            child: Text(
              DateFormat.yMMMMEEEEd().format(DateTime.now()),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
