import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.lightBlue[50],
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Column(children: [
            Container(
              height: 100,
              color: Colors.lightBlueAccent,
            ),
            SizedBox(height: 100),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              Image.asset('assets/images/Sasha.png'),
            ),
            SizedBox(height: 100),
            Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Image.asset('assets/images/icons8-phone-30.png'),
                    SizedBox(width: 16),
                    Text(
                      '+38 063 715 47 63',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                border: Border.all(color: Colors.red, width: 3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/icons8-user-tag-32.png'),
                  Text(
                    'a.zhylin1987@gmail.com',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ]),
        ]),
      ),
    );
  }
}
