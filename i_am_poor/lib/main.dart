import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('I am poor'),
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/46b63d3c-ae67-464c-9a37-670829b2a157/da34rkj-2da458c9-1b0d-4ea3-a6f0-6379ee7c2765.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQ2YjYzZDNjLWFlNjctNDY0Yy05YTM3LTY3MDgyOWIyYTE1N1wvZGEzNHJrai0yZGE0NThjOS0xYjBkLTRlYTMtYTZmMC02Mzc5ZWU3YzI3NjUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.8ryuMgVzqdJ3HFgy6F3OYEjK6I6rIy4bx89f4x7Qqro'),
          ),
        ),
      ),
    ),
  );
}
