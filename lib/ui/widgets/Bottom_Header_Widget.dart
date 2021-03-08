import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Data.dart';

class BottomHeader extends StatefulWidget {
  @override
  _BottomHeaderState createState() => _BottomHeaderState();
}

class _BottomHeaderState extends State<BottomHeader> {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var screenWidth = MediaQuery.of(context).size.width;
    var childrenBottom = [
      Container(
        width: screenWidth,
        height: 300,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image(image: Images.lastStackImage )),
      ),
    ];
    return Stack(children: [
      Container(
        color: Colors.white70,
        child: orientation == Orientation.portrait
            ? Column(
          children: childrenBottom,
        )
            : Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: childrenBottom.reversed.toList(),
          ),
        ),
      ),
      Container(
        width: screenWidth,
        height: 300,
        color: Colors.black45,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Container(child: Text('This web app is build with Flutter', style: WordStyle.bottomHeaderMadeBy)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                  child: Text('Contact', style: WordStyle.contact)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTheme(
                          data: IconThemeData(
                              color: Colors.white
                          ),
                          child: Icon(Icons.email)),
                      SizedBox(width: 10,),
                      Text('levmartens@gmail.com', style: WordStyle.bottomHeader),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 7),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTheme(
                          data: IconThemeData(
                              color: Colors.white
                          ),
                          child: Icon(Icons.phone)),
                      SizedBox(width: 10,),
                      Text('+61478190410                ', style: WordStyle.bottomHeader),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTheme(
                          data: IconThemeData(
                              color: Colors.white
                          ),
                          child: Icon(Icons.pin_drop)),
                      SizedBox(width: 10,),
                      Text('Melbourne, Victoria     ', style: WordStyle.bottomHeader,),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 17.0),
              child: Container(
                  child: GestureDetector(
                    onTap: () {_launchGitHubURL();},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/github2.png')),
                        SizedBox(width: 5,),
                        Text('github.com/LevMartens     ', style: WordStyle.bottomHeader),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0,top: 12.0),
              child: Container(
                  child: GestureDetector(
                    onTap: () {_launchStackOFURL();},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/stack.png')),
                        SizedBox(width: 5,),
                        Text('Stackoverflow               ', style: WordStyle.bottomHeader),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    ]);
  }
  _launchGitHubURL() async {
    const url = 'https://github.com/LevMartens';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchStackOFURL() async {
    const url = 'https://stackoverflow.com/users/13731962';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
