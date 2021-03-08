import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Data.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var screenWidth = MediaQuery.of(context).size.width;
    var children = [
      Container(
        width: screenWidth,
        height: screenWidth * 0.5123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image(image: Images.firstStackImage)),
      ),
    ];

    return Stack(children: [
      Container(
        color: Colors.white70,
        child: orientation == Orientation.portrait
            ? Column(
          children: children,
        )
            : Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children.reversed.toList(),
          ),
        ),
      ),
      Container(
        width: screenWidth,
        height: screenWidth * 0.5123,
        color: Colors.black45,
      ),
      Container(
        width: screenWidth,
        height: screenWidth * 0.5123,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Lev Martens.',style: WordStyle.header),
            Text('Swift, Java and Flutter Enthusiast ',style: WordStyle.headerSecond),
          ],
        )),),
    ]);
  }
}
