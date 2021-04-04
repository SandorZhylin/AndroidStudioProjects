import 'package:flutter/material.dart';

void main() {
  runApp(DifferentColors());
}

class DifferentColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Row(
          children: [
            Container(
              color: Colors.red,
              width: 100,
            ),
            Container(
              color: Colors.teal,
              width: 200,
              child: Container(
                  padding: EdgeInsets.only(top: 225),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        color: Colors.green,
                        height: 100,
                        width: 100,
                      )
                    ],
                  )),
            ),
            Container(
              color: Colors.blue,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
