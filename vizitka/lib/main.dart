import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.lightBlue[50],
          child: Column(
            children: [
              Container(
                height: 160,
                child: FittedBox(
                  child: Image.asset('assets/images/upper.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Spacer(),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Image.asset('assets/images/sancho.png'),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                child: Container(
                    margin: EdgeInsets.only(
                        top: 5, left: 20, right: 20, bottom: 10),
                    height: 50,
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
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 50),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  border: Border.all(color: Colors.red, width: 3),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Image.asset('assets/images/icons8-user-tag-32.png'),
                    SizedBox(width: 16),
                    Text(
                      'a.zhylin1987@gmail.com',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
