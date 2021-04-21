import 'dart:ui';

import 'package:flutter/material.dart';

class TileItem extends StatefulWidget {
  final bool isChecked;
  final String? image;
  final String title;

  final Function onChanged;

  TileItem({
    this.isChecked = false,
    required this.title,
    this.image,
    required this.onChanged,
  });

  @override
  _TileItemState createState() => _TileItemState();
}

class _TileItemState extends State<TileItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  bool isChecked = false;
  double position = 5;

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

  @override
  Widget build(BuildContext context) {
    bool isImageExists = !(widget.image == null);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      child: Row(
        children: [
          Checkbox(
            value: widget.isChecked,
            activeColor: widget.isChecked ? Colors.grey : Colors.black,
            onChanged: (bool? value) {
              print('$value');

              _controller.forward(from: 0.0);
              widget.onChanged(value);
            },
          ),
          Expanded(
            child: AnimatedBuilder(
              builder: (BuildContext context, Widget? child) {
                return Container(
                  padding: EdgeInsets.only(
                    left: _animation.value + 10.0,
                    right: 10.0 - _animation.value,
                  ),
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      color: widget.isChecked ? Colors.grey : Colors.black,
                      decoration:
                          widget.isChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                );
              },
              animation: _animation,
            ),
          ),
          GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemBuilder: (_, index) => Hero(
              tag: index.toString(),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      pageBuilder: (_, __, ___) =>
                          DetailedImage(tag: index.toString()),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  width: isImageExists ? 60.0 : 10.0,
                  height: 60.0,
                  decoration: isImageExists
                      ? BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: AssetImage((widget.image == null
                                ? 'assets/sample_avatar.png'
                                : widget.image)!),
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
                              offset: Offset(0.0, 4.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        )
                      : null,
                ),
              ),
            ),
            itemCount: 1,
          ),
        ],
      ),
    );
  }
}

class DetailedImage extends StatelessWidget {
  final String tag;

  const DetailedImage({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail screen"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 300.0,
          height: 300.0,
          child: Hero(
            tag: tag,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sample_avatar.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
