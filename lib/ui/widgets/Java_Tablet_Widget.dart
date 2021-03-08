import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../Data.dart';

class JavaTablet extends StatefulWidget {
  @override
  _JavaTabletState createState() => _JavaTabletState();
}

class _JavaTabletState extends State<JavaTablet> {
  AnimationController animationControllerForJava;
  AnimationController animationControllerForJavaPhone;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      SizedBox(height: 50,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: VisibilityDetector(
              key: Key('javaTitle'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                if(visiblePercentage > 10) {
                  animationControllerForJava.forward();
                }
                if(visiblePercentage == 0) {
                  animationControllerForJava.reverse();
                }
              },
              child: FadeIn(
                duration: Duration(milliseconds: 1000),
                manualTrigger: true,
                animate: false,
                controller: ( controller ) => animationControllerForJava = controller,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 75,
                              width: 75,
                              child: Image(image: Images.javaLogo) ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text('Java Quiz App', style: WordStyle.appTitle)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4,top: 2.0),
                                    child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrangeAccent,
                                            shape: BoxShape.circle
                                        )),
                                  ),
                                  SizedBox(width:5),
                                  Container(
                                      child: Text('Java', style: WordStyle.swift)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                          child: Text(Strings.javaDescription, style: WordStyle.general,)),
                      SizedBox(height: 60,),
                      Container(
                        child: Text('Technologies', style: WordStyle.technologies),),
                      SizedBox(height: 10,),
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Android Studio', style: WordStyle.general),),
                            Container(
                                child: Text('Observer Pattern', style: WordStyle.general)),
                            Container(
                                child: Text('Firebase', style: WordStyle.general)),
                            Container(
                                child: Text('Git', style: WordStyle.general)),
                          ],),
                      ],),
                      SizedBox(height: 20,),
                      GestureDetector(
                        child: Container(
                            height: 50,
                            width: 150,
                            child: Image(image: Images.availableOnGooglePlay, )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Center(
                child: VisibilityDetector(
                  key: Key('javaPhone'),
                  onVisibilityChanged: (visibilityInfo) {
                    var visiblePercentage = visibilityInfo.visibleFraction * 100;
                    if(visiblePercentage > 10) {
                      animationControllerForJavaPhone.forward();
                    }
                    if(visiblePercentage == 0) {
                      animationControllerForJavaPhone.reverse();
                    }
                  },
                  child: FadeIn(
                    duration: Duration(milliseconds: 1000),
                    manualTrigger: true,
                    animate: false,
                    controller: ( controller ) => animationControllerForJavaPhone = controller,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth > 1025 ? 130 : screenWidth > 726 && screenWidth < 1025 ? 30.0 : 10),
                      child: Container(
                          height: 450,
                          width: 220,
                          child: Image(image:Images.javaSS1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],);
  }
}
