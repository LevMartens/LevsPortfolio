import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lev_martens/ui/provider/value_provider.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../Data.dart';

class VocabexTablet extends StatefulWidget {
  @override
  _VocabexTabletState createState() => _VocabexTabletState();
}

class _VocabexTabletState extends State<VocabexTablet> {
  AnimationController animationControllerForMoreVocabex;
  AnimationController animationControllerForVocabex;
  AnimationController animationControllerForVocabexPhone;
  bool vocabexSelected = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    double vocabexACHeight() {
      if(vocabexSelected == true && screenWidth < 1025) { return 1500;}
      if(vocabexSelected == true && screenWidth > 1025) { return 1010;}
      if(vocabexSelected == false) { return 0;} else {return 0;}
    }
    vocabexSelected = Provider.of<ValueProvider>(context, listen: true).vocabexSelectedTablet;
    return Column(children: [
      SizedBox(height: 50,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: VisibilityDetector(
              key: Key('VocabexTitle'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                debugPrint(
                    'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
                if(visiblePercentage > 10) {
                  print('>10');
                  animationControllerForVocabex.forward();
                }
                if(visiblePercentage == 0) {
                  print('<50');
                  animationControllerForVocabex.reverse();
                }
              },
              child: FadeIn(
                duration: Duration(milliseconds: 1000),
                manualTrigger: true,
                animate: false,
                controller: ( controller ) => animationControllerForVocabex = controller,
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 75,
                              width: 75,
                              child: Image(image: Images.vocabexLogo) ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text('Vocabex', style: WordStyle.appTitle)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4,top: 2.0),
                                    child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            shape: BoxShape.circle
                                        )),
                                  ),
                                  SizedBox(width:5),
                                  Container(
                                      child: Text('Swift', style: WordStyle.swift)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                          width: screenWidth > 1025 ? 320 : 220,
                          child: Text(Strings.vocabexDescription, style: WordStyle.general,)),
                      SizedBox(height: 60,),
                      Container(
                        child: Text('Technologies', style: WordStyle.technologies),),
                      SizedBox(height: 10,),
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('CoreData', style: WordStyle.general),),
                            Container(
                                child: Text('Xcode', style: WordStyle.general)),
                            Container(
                                child: Text('Firebase', style: WordStyle.general)),
                            Container(
                                child: Text('Git', style: WordStyle.general)),
                          ],),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text('Multithreading', style: WordStyle.general)),
                            Container(
                                child: Text('Vision', style: WordStyle.general)),
                            Container(
                                child: Text('Observer', style: WordStyle.general)),
                          ],)
                      ],),
                      SizedBox(height: 20,),
                      GestureDetector(
                        child: Container(
                            height: 50,
                            width: 150,
                            child: Image(image: Images.availableOnAppStore, )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: GestureDetector(
                          onTap: (){
                            if(vocabexSelected == false) {
                              Provider.of<ValueProvider>(context, listen: false).changeVocabexSelectedTabletTo(true);
                            } else {
                              Provider.of<ValueProvider>(context, listen: false).changeVocabexSelectedTabletTo(false);
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26)
                              ),
                              child: Text('More info', style:  WordStyle.more)),
                        ),
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
                  key: Key('VocabexPhone'),
                  onVisibilityChanged: (visibilityInfo) {
                    var visiblePercentage = visibilityInfo.visibleFraction * 100;
                    debugPrint(
                        'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
                    if(visiblePercentage > 10) {
                      print('>10');
                      animationControllerForVocabexPhone.forward();
                    }
                    if(visiblePercentage == 0) {
                      print('<50');
                      animationControllerForVocabexPhone.reverse();
                    }
                  },
                  child: FadeIn(
                    duration: Duration(milliseconds: 1000),
                    manualTrigger: true,
                    animate: false,
                    controller: ( controller ) => animationControllerForVocabexPhone = controller,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth > 726 ? 70.0 : 0),
                      child: Container(
                          height: 500,
                          width: 300,
                          child: Image(image:Images.vocabexSS2)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      Center(
        child: AnimatedContainer(
            decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black, width: 10), right: BorderSide(color: Colors.black, width: 10))),
            height: vocabexACHeight(),
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            child: VisibilityDetector(
              key: Key('MoreVocabex'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                debugPrint(
                    'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
                if(visiblePercentage > 10) {
                  print('>10');
                  animationControllerForMoreVocabex.forward();
                }
                if(visiblePercentage == 0) {
                  print('<50');
                  animationControllerForMoreVocabex.reverse();
                }
              },
              child: FadeIn(
                duration: Duration(milliseconds: 700),
                manualTrigger: true,
                animate: false,
                controller: ( controller ) => animationControllerForMoreVocabex = controller,
                child: screenWidth > 1025 ? Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: vocabexSelected == true ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 490,
                                width: 230,
                                child: Image(image:Images.vocabexSS3)),
                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(Strings.vocabexSS3,
                                        style: WordStyle.general),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 0),
                              child: Row(
                                children: [
                                  Container(
                                      height: 490,
                                      width: 230,
                                      child: Image(image:Images.vocabexSS1)),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 200,
                                          child: Text(Strings.vocabexSS2,
                                              style: WordStyle.general),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 490,
                                width: 230,
                                child: Image(image:Images.vocabexSS4)),
                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(Strings.vocabexSS4,
                                        style: WordStyle.general),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(vocabexSelected == false) {
                            Provider.of<ValueProvider>(context, listen: false).changeVocabexSelectedTabletTo(true);
                          } else {
                            Provider.of<ValueProvider>(context, listen: false).changeVocabexSelectedTabletTo(false);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)
                            ),
                            child: Icon(Icons.arrow_drop_up_sharp),
                          ),
                        ),
                      ),
                    ],
                  ) : Container(),
                ) : Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: vocabexSelected == true ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Row(
                              children: [
                                Container(
                                    height: 490,
                                    width: 230,
                                    child: Image(image: Images.vocabexSS3)),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.vocabexSS3,
                                            style: WordStyle.general),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Row(
                              children: [
                                Container(
                                    height: 490,
                                    width: 230,
                                    child: Image(image:Images.vocabexSS1)),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.vocabexSS2,
                                            style: WordStyle.general),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Row(
                              children: [
                                Container(
                                    height: 490,
                                    width: 230,
                                    child: Image(image:Images.vocabexSS4)),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.vocabexSS4,
                                            style: WordStyle.general),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          if(vocabexSelected == false) {
                            Provider.of<ValueProvider>(context, listen: false).changeVocabexSelectedTabletTo(true);
                          } else {
                            Provider.of<ValueProvider>(context, listen: false).changeVocabexSelectedTabletTo(false);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)
                            ),
                            child: Icon(Icons.arrow_drop_up_sharp),
                          ),
                        ),
                      ),
                    ],
                  ) : Container(),
                ),
              ),
            )),
      ),
    ],);
  }
}
