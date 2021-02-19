import 'package:flutter/material.dart';

void main() {
  runApp(WidgetsTraining());
}

class WidgetsTraining extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Training',
      home: Scaffold(
        backgroundColor: (Colors.grey),
        appBar: AppBar(
        title: Text('This is a widgets test')
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: (Colors.red),
            child: Column(
                children: [
                    Text ('SATOR', style: TextStyle(
                      color: Colors.blue
                    ),),
                    Text ('EREPO', style: TextStyle(
                        color: Colors.yellow
                    ),),
                    Text ('OPERA', style: TextStyle(
                        color: Colors.green
                    ),),
                    Text ('ROTAS', style: TextStyle(
                    color: Colors.white
                    ),),
                  ],
            )
          ),
        ),
          bottomSheet: Row(
          children: [
            Text ('TENET')
        ],
      ),
      ),
    );
  }
}
