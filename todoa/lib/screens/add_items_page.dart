import 'package:flutter/material.dart';

class AddItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopBar(context),
            AddItems(),
          ],
        ),
      ),
    );
  }
}

Widget _buildTopBar(BuildContext context) {
  return Container(
    height: 100,
    margin: EdgeInsets.only(
      bottom: 150,
    ),
    decoration: BoxDecoration(
      color: Colors.deepOrange,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    child: Center(
      child: Text(
        'Add items',
        style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

class AddItems extends StatefulWidget {
  @override
  __AddItemsState createState() => __AddItemsState();
}

class __AddItemsState extends State<AddItems> {
  final enteredItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: TextField(
            controller: enteredItem,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(40.0),
          child: FloatingActionButton(
            onPressed: () => {
              Navigator.pop(
                context,
              ),
              ScaffoldMessenger.of(context)
                ..showSnackBar(SnackBar(content: Text(enteredItem.text)))
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
