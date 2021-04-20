import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'AnimatedPositioned'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _left = 0.0;
  double _right = 10.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 200.0,
          child: Stack(
            children: [
              AnimatedPositioned(
                left: _left,
                right: _right,
                duration: const Duration(milliseconds: 100),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _left = _left > 0.0 ? 0.0 : 10.0;
            _right = _right < 10.0 ? 10.0 : 0.0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
