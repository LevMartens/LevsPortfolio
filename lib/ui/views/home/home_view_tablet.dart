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
  final _scrollController = ScrollController(keepScrollOffset: false);
  AnimationController animationControllerForTest;
  AnimationController animationControllerForAboutMe;
  AnimationController animationControllerForPortfolio;
  AnimationController animationControllerForPhone;
  AnimationController animationControllerForVTitle;
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
    print(screenWidth);
    print(oneThirdSW);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2300,
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
                  Row(
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

                            child: Container(

                                child: Text('Verossa Valley', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 35, fontWeight: FontWeight.w500),)),
                          ),
                        ),
                      ),
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
                              padding: const EdgeInsets.only(left: 500.0),
                              child: Container(
                                height: 500,
                                  width: 300,

                                  child: Image.asset('assets/screenshot-3.jpg')),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                  

                ],

              ),
              //SizedBox(height: 2050,),



            ]),
          ),
        ],
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