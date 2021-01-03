import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lev_martens/widgets/app_drawer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeTablet extends StatefulWidget {

   HomeTablet({
    Key key,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeTablet> {
  bool selected = false;
  final _scrollController = ScrollController(keepScrollOffset: false);
  AnimationController animationControllerForTest;
  AnimationController animationControllerForAboutMe;
  AnimationController animationControllerForPortfolio;
  AnimationController animationControllerForPhone;
  AnimationController animationControllerForTPhone;
  AnimationController animationControllerForVTitle;
  AnimationController animationControllerForTTitle;
  @override
  Widget build(BuildContext context) {

    bool startAnimation = false;
    var orientation = MediaQuery.of(context).orientation;
    var screenWidth = MediaQuery.of(context).size.width; //orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width - 250;
    var halfScreenWidth = screenWidth / 2;
    var oneThirdSW = screenWidth / 20;
    var children = [
      Container(

        width: screenWidth,
        height: screenWidth * 0.5123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/road.jpg')),
      ),
      // Expanded(
      //
      //   child: Container(
      //
      //   ),
      // ),
      // AppDrawer()
    ];
    var childrenBottom = [
      Container(

        width: screenWidth,
        height: screenWidth * 0.2123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/Ice.jpg')),
      ),

    ];
    print(screenWidth);
    print(oneThirdSW);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(

          controller: _scrollController,
          slivers: [
            SliverFixedExtentList(
              itemExtent: 2245,

              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    Stack(children: [
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
                            Text('HELLO. WORLD.',style: TextStyle(color: Color(0xFFf4f4f4), fontSize: 14, fontWeight: FontWeight.w500),),
                            Text('I\'m Lev Martens.',style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 45, fontWeight: FontWeight.w500),),
                            Text('Website / App Developer',style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),),
                          ],
                        )),),





                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(height: 100,),
                        Center(
                          child: VisibilityDetector(

                            key: Key('About Me'),

                            onVisibilityChanged: (visibilityInfo) {
                              var visiblePercentage = visibilityInfo.visibleFraction * 100;
                              debugPrint(
                                  'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                              if(visiblePercentage > 10) {
                                print('>10');
                                animationControllerForAboutMe.forward();
                              }
                              if(visiblePercentage == 0) {
                                print('<50');
                                animationControllerForAboutMe.reverse();
                              }

                            },
                            child: FadeIn(
                              duration: Duration(milliseconds: 1000),
                              manualTrigger: true,
                              animate: false,
                              controller: ( controller ) => animationControllerForAboutMe = controller,

                              child: Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: Container(
                                  height: 250,
                                  width: 600,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 30.0),
                                        child: Container(
                                          height: 150,
                                          width: 150,

                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage('assets/IMG_1102.jpg')
                                              )

                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 150.0),
                                              child: Text('ABOUT ME', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                            ),
                                            SizedBox(height: 25,),
                                            Container(
                                              width: 375,
                                              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50,),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: VisibilityDetector(

                            key: Key('Portfolio'),

                            onVisibilityChanged: (visibilityInfo) {
                              var visiblePercentage = visibilityInfo.visibleFraction * 100;
                              debugPrint(
                                  'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                              if(visiblePercentage > 10) {
                                print('>10');
                                animationControllerForPortfolio.forward();
                              }
                              if(visiblePercentage == 0) {
                                print('<50');
                                animationControllerForPortfolio.reverse();
                              }

                            },
                            child: FadeIn(
                              duration: Duration(milliseconds: 1000),
                              manualTrigger: true,
                              animate: false,
                              controller: ( controller ) => animationControllerForPortfolio = controller,

                              child: Text('PORTFOLIO', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 45, fontWeight: FontWeight.w500),),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //slight delay in fade in
                            Center(
                              child: VisibilityDetector(

                                key: Key('VTitle'),

                                onVisibilityChanged: (visibilityInfo) {
                                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                                  debugPrint(
                                      'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
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
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: Text('Verossa Valley', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 35, fontWeight: FontWeight.w500),)),
                                        SizedBox(height: 10,),
                                        Container(
                                          child: Text('Fully fledged webshop demo app', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                        SizedBox(height: 60,),
                                        Container(
                                            child: Text('Technologies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w200),)),
                                        SizedBox(height: 10,),
                                        Row(children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            Container(
                                                child: Text('Flutter', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                            Container(
                                                child: Text('Android Studio', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                            Container(
                                                child: Text('Firebase', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                              Container(
                                                  child: Text('Git', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),

                                          ],),
                                          SizedBox(width: 20,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            Container(
                                                child: Text('Stripe Payments', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                            Container(
                                                child: Text('SendGrid Email', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                            Container(
                                                child: Text('Provider', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                          ],)
                                        ],),
                                        SizedBox(height: 60,),
                                        GestureDetector(
                                          onTap: (){
                                            if(selected == false) {
                                              setState(() {
                                                selected = true;
                                              });
                                            } else {
                                              setState(() {
                                                selected = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                              margin: const EdgeInsets.all(15.0),
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black26)
                                              ),
                                              child: Text('More info', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
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
                                          'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
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
                                        padding: const EdgeInsets.only(left: 150.0),
                                        child: Container(

                                          height: 500,
                                            width: 300,

                                            child: Image.asset('assets/HomePageScreen.jpg')),
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


                            height: selected ? 500.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                              ],
                            )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //slight delay in fade in

                            Row(
                              children: [
                                Center(
                                  child: VisibilityDetector(

                                    key: Key('TPhone'),

                                    onVisibilityChanged: (visibilityInfo) {
                                      var visiblePercentage = visibilityInfo.visibleFraction * 100;
                                      debugPrint(
                                          'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                                      if(visiblePercentage > 10) {
                                        print('>10');
                                        animationControllerForTPhone.forward();
                                      }
                                      if(visiblePercentage == 0) {
                                        print('<50');
                                        animationControllerForTPhone.reverse();
                                      }

                                    },
                                    child: FadeIn(
                                      duration: Duration(milliseconds: 1000),
                                      manualTrigger: true,
                                      animate: false,
                                      controller: ( controller ) => animationControllerForTPhone = controller,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0.0),
                                        child: Container(

                                            height: 500,
                                            width: 300,

                                            child: Image.asset('assets/CommingSoon.jpg')),
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: VisibilityDetector(

                                key: Key('TTitle'),

                                onVisibilityChanged: (visibilityInfo) {
                                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                                  debugPrint(
                                      'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                                  if(visiblePercentage > 10) {
                                    print('>10');
                                    animationControllerForTTitle.forward();
                                  }
                                  if(visiblePercentage == 0) {
                                    print('<50');
                                    animationControllerForTTitle.reverse();
                                  }

                                },
                                child: FadeIn(
                                  duration: Duration(milliseconds: 1000),
                                  manualTrigger: true,
                                  animate: false,
                                  controller: ( controller ) => animationControllerForTTitle = controller,

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 200, right: 100),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: Text('Vocabear', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 35, fontWeight: FontWeight.w500),)),
                                        SizedBox(height: 10,),
                                        Container(
                                            child: Text('English vocabulary builder', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                        SizedBox(height: 60,),
                                        Container(
                                            child: Text('Technologies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w200),)),
                                        SizedBox(height: 10,),
                                        Row(children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: Text('Swift', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                              Container(
                                                  child: Text('Xcode', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                              Container(
                                                  child: Text('Firebase', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),


                                            ],),
                                          SizedBox(width: 20,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: Text('Cocoapods', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                              Container(
                                                  child: Text('Core Data', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                              Container(
                                                  child: Text('Networking', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                            ],)
                                        ],),
                                        SizedBox(height: 60,),


                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        Stack(children: [
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
                            height: screenWidth * 0.2123,
                            color: Colors.black45,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Container(
                                      child: Text('Contact', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 30, fontWeight: FontWeight.w200),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.email),
                                          SizedBox(width: 10,),
                                          Text('levmartens@gmail.com', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.phone),
                                          SizedBox(width: 10,),
                                          Text('+61478190410                ', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.pin_drop),
                                          SizedBox(width: 10,),
                                          Text('Melbourne, Victoria     ', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),
                                        ],
                                      )),
                                ),

                              ],
                            ),
                          ),

                        ]),


                      ],

                    ),
                  ],
                ),
                //SizedBox(height: 2050,),



              ]),
            ),
          ],
        ),
      ),
    );
  }
}


// VisibilityDetector(
//
// key: Key('my-widget-key'),
//
// onVisibilityChanged: (visibilityInfo) {
// var visiblePercentage = visibilityInfo.visibleFraction * 100;
// debugPrint(
// 'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
// if(visiblePercentage == 100) {
// print('>100');
// animationControllerForTest.forward();
// }
// if(visiblePercentage < 50) {
// print('<50');
// animationControllerForTest.reverse();
// }
//
// },
// child: Center(child: BounceInDown(
// manualTrigger: true,
// animate: false,
// controller: ( controller ) => animationControllerForTest = controller,
// child: Container(height: 100, width:100,color: Colors.red,))),
// ),