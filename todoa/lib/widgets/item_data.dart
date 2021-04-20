import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoa/model/tile_item.dart';

class TileItem extends StatefulWidget {
  final ItemData itemData;
  TileItem({required this.itemData});
  @override
  TileItemState createState() => TileItemState(itemData);
}

class TileItemState extends State<TileItem>
    with SingleTickerProviderStateMixin {
  final ItemData itemData;
  TileItemState(this.itemData);
  late AnimationController _controller;
  late Animation _animation;

  bool isChecked = false;
  double position = 5;
  @override
  Widget build(BuildContext context) {
    bool isImageExists = !(itemData.image == null);

    @override
    void initState() {
      super.initState();
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      );
      _animation = Tween(begin: 0.0, end: 10.0)
          .chain(CurveTween(curve: Curves.elasticIn))
          .animate(_controller)
            ..addStatusListener(
              (status) {
                if (status == AnimationStatus.completed) {
                  _controller.reverse();
                }
              },
            );
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      child: Row(
        children: [
          Checkbox(
            value: itemData.isChecked,
            checkColor: Colors.white,
            activeColor: Colors.greenAccent,
            onChanged: (bool? value) {
              setState(() {
                _controller.forward(from: 0.0);
                itemData.isChecked = !itemData.isChecked;
              });
            },
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            width: isImageExists ? 60.0 : 10.0,
            height: 60.0,
            decoration: isImageExists
                ? BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage((itemData.image == null
                          ? 'assets/sample_avatar.png'
                          : itemData.image)!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  )
                : null,
          ),
          AnimatedBuilder(
            builder: (BuildContext context, Widget? child) {
              return Container(
                padding: EdgeInsets.only(
                  left: _animation.value + 10.0,
                  right: 10.0 - _animation.value,
                ),
                child: Expanded(
                  child: Text(
                    itemData.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            animation: _animation,
          ),
        ],
      ),
    );
  }
}
