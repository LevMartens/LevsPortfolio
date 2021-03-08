import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lev_martens/ui/provider/value_provider.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../Data.dart';

class VerossaTablet extends StatefulWidget {
  @override
  _VerossaTabletState createState() => _VerossaTabletState();
}

class _VerossaTabletState extends State<VerossaTablet> {
  AnimationController animationControllerForMoreVerossa;
  AnimationController animationControllerForPhone;
  AnimationController animationControllerForTPhone;
  AnimationController animationControllerForVTitle;
  AnimationController animationControllerForTTitle;
  bool verossaSelected = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    double verossaACHeight() {
      if(verossaSelected == true && screenWidth < 1025) { return 2000;}
      if(verossaSelected == true && screenWidth > 1025) { return 1010;}
      if(verossaSelected == false) { return 0;} else {return 0;}
    }
    verossaSelected = Provider.of<ValueProvider>(context, listen: true).verossaSelectedTablet;
    return Column(children: [
      SizedBox(height: 50,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: VisibilityDetector(
              key: Key('VTitle'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                debugPrint(
                    'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
                if(visiblePercentage > 10) {
                  print('>10');
                  animationControllerForVTitle.forward();
                }
                if(visiblePercentage == 0) {
                  print('<50');
                  animationControllerForVTitle.reverse();
                }
              },
              child: FadeIn(
                duration: Duration(milliseconds: 1000),
                manualTrigger: true,
                animate: false,
                controller: ( controller ) => animationControllerForVTitle = controller,
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 75,
                              width: 75,
                              child: Image(image: Images.verossaLogo) ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text('Verossa Valley', style: WordStyle.appTitle)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4,top: 2.0),
                                    child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.teal,
                                            shape: BoxShape.circle
                                        )),
                                  ),
                                  SizedBox(width:5),
                                  Container(
                                      child: Text('Dart', style: WordStyle.swift)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                          child: Text(Strings.verossaDescription, style: WordStyle.general,)),
                      SizedBox(height: 60,),
                      Container(
                        child: Text('Technologies', style: WordStyle.technologies),),
                      SizedBox(height: 10,),
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Flutter', style: WordStyle.general),),
                            Container(
                                child: Text('Android Studio', style: WordStyle.general)),
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
                                child: Text('Stripe Payments', style: WordStyle.general)),
                            Container(
                                child: Text('SendGrid Email', style: WordStyle.general)),
                            Container(
                                child: Text('Provider', style: WordStyle.general)),
                          ],)
                      ],),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              child: Image(image: Images.testFlightIcon, )),
                          SizedBox(width:10),
                          Container(child: Text('Available on TestFlight', style: WordStyle.general)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: GestureDetector(
                          onTap: (){
                            if(verossaSelected == false) {
                              Provider.of<ValueProvider>(context, listen: false).changeVerossaSelectedTabletTo(true);
                            } else {
                              Provider.of<ValueProvider>(context, listen: false).changeVerossaSelectedTabletTo(false);
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
                  key: Key('Phone'),
                  onVisibilityChanged: (visibilityInfo) {
                    var visiblePercentage = visibilityInfo.visibleFraction * 100;
                    debugPrint(
                        'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
                    if(visiblePercentage > 10) {
                      print('>10');
                      animationControllerForPhone.forward();
                    }
                    if(visiblePercentage == 0) {
                      print('<50');
                      animationControllerForPhone.reverse();
                    }
                  },
                  child: FadeIn(
                    duration: Duration(milliseconds: 1000),
                    manualTrigger: true,
                    animate: false,
                    controller: ( controller ) => animationControllerForPhone = controller,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth > 1025 ? 105.0 : 0),
                      child: Container(
                          height: 500,
                          width: screenWidth > 760 ? 300 : 245,
                          child: Image(image:Images.screenshotHomePage)),
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
            height: verossaACHeight(),
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            child: VisibilityDetector(
              key: Key('MoreVerossa'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                if(visiblePercentage > 10) {
                  animationControllerForMoreVerossa.forward();
                }
                if(visiblePercentage == 0) {
                  animationControllerForMoreVerossa.reverse();
                }
              },
              child: FadeIn(
                duration: Duration(milliseconds: 700),
                manualTrigger: true,
                animate: false,
                controller: ( controller ) => animationControllerForMoreVerossa = controller,
                child: screenWidth > 1025 ? Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: verossaSelected == true ? Column(
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
                                    child: Image(image:Images.screenshot1)),
                                SizedBox(width: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot1,
                                            style: WordStyle.general),
                                      ),
                                    ],
                                  ),
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
                                    child: Image(image:Images.screenshot2)),
                                SizedBox(width: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot2,
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
                                    child: Image(image:Images.screenshot3)),
                                SizedBox(width: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot3,
                                            style: WordStyle.general),
                                      ),
                                    ],
                                  ),
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
                                    child: Image(image:Images.screenshot4)),
                                SizedBox(width: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot4,
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
                          if(verossaSelected == false) {
                            Provider.of<ValueProvider>(context, listen: false).changeVerossaSelectedTabletTo(true);
                          } else {
                            Provider.of<ValueProvider>(context, listen: false).changeVerossaSelectedTabletTo(false);
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
                  child: verossaSelected == true ? Column(
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
                                    child: Image(image: Images.screenshot1)),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot1,
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
                                    child: Image(image:Images.screenshot2)),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot2,
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
                                    child: Image(image:Images.screenshot3)),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot3,
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
                                    child: Image(image:Images.screenshot4)),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(Strings.screenshot4,
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
                          if(verossaSelected == false) {
                            Provider.of<ValueProvider>(context, listen: false).changeVerossaSelectedTabletTo(true);
                          } else {
                            Provider.of<ValueProvider>(context, listen: false).changeVerossaSelectedTabletTo(false);
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
