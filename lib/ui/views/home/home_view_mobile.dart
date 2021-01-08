import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lev_martens/Texts.dart';





class HomeMobilePortrait extends StatefulWidget {

  HomeMobilePortrait({
    Key key,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _HomePageStatePortrait();
}

class _HomePageStatePortrait extends State<HomeMobilePortrait> {
  bool aboutMeSelected = false;
  bool verossaSelected = false;
  final _scrollController = ScrollController(keepScrollOffset: false);
  AnimationController animationControllerForTest;
  AnimationController animationControllerForAboutMe;
  AnimationController animationControllerForPortfolio;
  AnimationController animationControllerForPhone;
  AnimationController animationControllerForTPhone;
  AnimationController animationControllerForVTitle;
  AnimationController animationControllerForTTitle;
  AnimationController animationControllerForMoreAbout;
  AnimationController animationControllerForMoreVerossa;

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
  _launchLinkedInURL() async {
    const url = 'https://au.linkedIn.com/in/levmartens';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    bool startAnimation = false;
    var orientation = MediaQuery.of(context).orientation;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width; //orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width - 250;
    var halfScreenWidth = screenWidth / 2;
    var oneThirdSW = screenWidth / 20;
    double a = 0 - screenWidth;
    double b = -a ;
    double c = 1173 - screenWidth;
    var children = [
      Container(

        width: screenWidth,
        height: screenWidth * 0.5123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/road.jpg')),
      ),

    ];
    var childrenBottom = [
      Container(

        width: screenWidth,
        height: 300,//screenWidth < 1173 ? 300 + c : 300 -c,//screenWidth * 0.2123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/background1.png')),
      ),

    ];
    print("screenwidth: $screenWidth");


    double verossaACHeight() {
      if(verossaSelected == true && screenWidth < 1025) { return 2810;}
      if(verossaSelected == true && screenWidth > 1025) { return 1010;}
      if(verossaSelected == false) { return 0;}
    }
    double aboutMeACHeight() {
      if(aboutMeSelected == true && screenWidth < 1025) { return 1210;}
      if(aboutMeSelected == true && screenWidth > 1025) { return 580;}
      if(aboutMeSelected == false) { return 0;}
    }


    return Scaffold(

      body: Container(
        height: 2400,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
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
                      Text('HELLO. WORLD.',style: TextStyle(color: Color(0xFFf4f4f4), fontSize: 12, fontWeight: FontWeight.w500),),
                      Text('I\'m Lev Martens.',style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),),
                      Text('Website / App Developer',style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),),
                    ],
                  )),),





              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 60,),
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
                            height: 410,
                            width: 400,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 90.0),
                                      child: Container(

                                        height: 100,
                                        width: 100,

                                        decoration: BoxDecoration(

                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage('assets/IMG_1102.jpg')
                                            )

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 95.0),
                                        child: Text('ABOUT ME', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 15, fontWeight: FontWeight.w900),),
                                      ),
                                      SizedBox(height: 25,),
                                      Container(

                                        width: 150,
                                        child: Text(Texts.aboutMe,

                                          style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                      ),
                                      SizedBox(height: 25,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 95.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            if(aboutMeSelected == false) {
                                              setState(() {
                                                aboutMeSelected = true;
                                              });
                                            } else {



                                              setState(() {
                                                aboutMeSelected = false;
                                              });


                                            }
                                          },
                                          child: Container(
                                              margin: const EdgeInsets.all(0.0),
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black26)
                                              ),
                                              child: Text('More about me', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                        ),
                                      ),
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
                      child: AnimatedContainer(
                        //color: Colors.black12,
                        decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black, width: 10), right: BorderSide(color: Colors.black, width: 10))),



                        height: aboutMeACHeight(),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                        child: VisibilityDetector(

                          key: Key('MoreAbout'),

                          onVisibilityChanged: (visibilityInfo) {
                            var visiblePercentage = visibilityInfo.visibleFraction * 100;
                            debugPrint(
                                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                            if(visiblePercentage > 10) {
                              print('>10');
                              animationControllerForMoreAbout.forward();
                            }
                            if(visiblePercentage == 0) {
                              print('<50');
                              animationControllerForMoreAbout.reverse();
                            }

                          },
                          child: FadeIn(
                            duration: Duration(milliseconds: 700),
                            manualTrigger: true,
                            animate: false,
                            controller: ( controller ) => animationControllerForMoreAbout = controller,

                            child: screenWidth > 1025 ? Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: aboutMeSelected == true ? Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Row(
                                          children: [

                                            Container(

                                                height: 150,
                                                width: 110,

                                                child: Image.asset('assets/IMG_0888.png')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Personal Life', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 300,
                                                    child: Text(Texts.personalLife,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40, top: 50),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(

                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8484.JPG')),
                                                Container(


                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8181.JPG')),
                                              ],
                                            ),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Work History', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 300,
                                                    child: Text(Texts.workHistory,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:25.0, right: 170),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _launchLinkedInURL();
                                                      },
                                                      child: Container(
                                                        child: Text('LinkedIn Page', style: TextStyle(decoration: TextDecoration.underline,fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),),
                                                      ),
                                                    ),
                                                  )
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
                                        padding: const EdgeInsets.only(top:30),
                                        child: Row(
                                          children: [

                                            Container(

                                                height: 200,
                                                width: 180,

                                                child: Image.asset('assets/music.png')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Hobbies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(

                                                    width: 300,
                                                    child: Text(Texts.hobbies
                                                      ,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
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
                                      if(aboutMeSelected == false) {
                                        setState(() {
                                          aboutMeSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          aboutMeSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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
                              child: aboutMeSelected == true ? Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 50, right: 30),
                                        child: Row(
                                          children: [

                                            Container(


                                                height: 150,
                                                width: 110,

                                                child: Image.asset('assets/IMG_0888.png')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 50.0),
                                                    child: Text('Personal Life', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 150,
                                                    child: Text(Texts.personalLife,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
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
                                        padding: const EdgeInsets.only(left: 0, top: 50, right: 30),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(

                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8484.JPG')),
                                                Container(


                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8181.JPG')),
                                              ],
                                            ),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 50.0),
                                                    child: Text('Work History', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 150,
                                                    child: Text(Texts.workHistory,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:25.0, right: 170),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _launchLinkedInURL();
                                                      },
                                                      child: Container(
                                                        child: Text('LinkedIn Page', style: TextStyle(decoration: TextDecoration.underline,fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),),
                                                      ),
                                                    ),
                                                  )
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
                                        padding: const EdgeInsets.only(top:50, right: 60),
                                        child: Row(
                                          children: [

                                            Container(

                                                height: 200,
                                                width: 120,

                                                child: Image.asset('assets/music.png')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 90.0),
                                                    child: Text('Hobbies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(

                                                    width: 150,
                                                    child: Text(Texts.hobbies,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
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
                                      if(aboutMeSelected == false) {
                                        setState(() {
                                          aboutMeSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          aboutMeSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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
                        ),
                      )),




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

                        child: Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Text('PORTFOLIO', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 35, fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
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
                                    padding: EdgeInsets.only(left: 0),
                                    child: Container(

                                        height: 500,
                                        width: 200,

                                        child: Image.asset('assets/HomePageScreen.jpg')),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
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
                                      child: Text('Verossa Valley', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),)),
                                  SizedBox(height: 10,),
                                  Container(
                                      child: Text('Fully fledged webshop demo app', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                  SizedBox(height: 40,),
                                  Container(
                                      child: Text('Technologies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w200),)),
                                  SizedBox(height: 10,),
                                  Row(children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: Text('Flutter', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                        Container(
                                            child: Text('Android Studio', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                        Container(
                                            child: Text('Firebase', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                        Container(
                                            child: Text('Git', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),

                                      ],),
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: Text('Stripe Payments', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                        Container(
                                            child: Text('SendGrid Email', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                        Container(
                                            child: Text('Provider', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                      ],)
                                  ],),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Container(

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),

                                          height: 30,
                                          width: 30,

                                          child: Image.asset('assets/TestFlight_Icon.png')),
                                      SizedBox(width: 10,),
                                      Container(
                                          child: Text('Available on TestFlight', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  GestureDetector(
                                    onTap: (){
                                      if(verossaSelected == false) {
                                        setState(() {
                                          verossaSelected = true;
                                        });
                                      } else {
                                        setState(() {
                                          verossaSelected = false;
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

                      ],
                      )


                    ],
                  ),
                  Center(
                    child: AnimatedContainer(
                      //color: Colors.white,
                        decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black, width: 10), right: BorderSide(color: Colors.black, width: 10))),


                        height: verossaACHeight(),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                        child: VisibilityDetector(

                          key: Key('MoreVerossa'),

                          onVisibilityChanged: (visibilityInfo) {
                            var visiblePercentage = visibilityInfo.visibleFraction * 100;
                            debugPrint(
                                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                            if(visiblePercentage > 10) {
                              print('>10');
                              animationControllerForMoreVerossa.forward();
                            }
                            if(visiblePercentage == 0) {
                              print('<50');
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

                                                child: Image.asset('assets/screenshot4.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text(Texts.screenshot1,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot3.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text(Texts.screenshot2,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot5.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text(Texts.screenshot3,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot6.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text(Texts.screenshot4,

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
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
                                        setState(() {
                                          verossaSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          verossaSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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
                                            Column(children: [
                                              Container(


                                                height: 490,
                                                width: 230,

                                                child: Image.asset('assets/screenshot4.jpg')),
                                              SizedBox(width: 0,),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 0.0),
                                                child: Column(
                                                  children: [

                                                    Container(
                                                      width: 200,
                                                      child: Text(Texts.screenshot1,

                                                        style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                                    ),
                                                  ],
                                                ),
                                              ),],)



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
                                            Column(children: [
                                              Container(

                                                height: 490,
                                                width: 230,

                                                child: Image.asset('assets/screenshot3.jpg')),
                                              SizedBox(width: 0,),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 0.0),
                                                child: Column(
                                                  children: [

                                                    Container(
                                                      width: 200,
                                                      child: Text(Texts.screenshot2,

                                                        style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                                    ),
                                                  ],
                                                ),
                                              ),],)


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
                                            Column(children: [
                                              Container(


                                                height: 490,
                                                width: 230,

                                                child: Image.asset('assets/screenshot5.jpg')),
                                              SizedBox(width: 0,),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 0.0),
                                                child: Column(
                                                  children: [

                                                    Container(
                                                      width: 200,
                                                      child: Text(Texts.screenshot3,

                                                        style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                                    ),
                                                  ],
                                                ),
                                              ),],)



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
                                            Column(children: [
                                              Container(

                                                  height: 490,
                                                  width: 230,

                                                  child: Image.asset('assets/screenshot6.jpg')),
                                              SizedBox(width: 0,),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 0.0),
                                                child: Column(
                                                  children: [

                                                    Container(
                                                      width: 200,
                                                      child: Text(Texts.screenshot4,

                                                        style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],)



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  GestureDetector(
                                    onTap: (){
                                      if(verossaSelected == false) {
                                        setState(() {
                                          verossaSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          verossaSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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





                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
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
                                        width: 200,

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
                                padding: EdgeInsets.only(left: screenWidth > 727 ? 150 : 0, right: screenWidth > 640 ? 110 : 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Text('Vocabear', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),)),
                                    SizedBox(height: 10,),
                                    Container(
                                        child: Text('English vocabulary builder', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                    SizedBox(height: 40,),
                                    Container(
                                        child: Text('Technologies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w200),)),
                                    SizedBox(height: 10,),
                                    Row(children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text('Swift', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                          Container(
                                              child: Text('Xcode', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                          Container(
                                              child: Text('Firebase', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),


                                        ],),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text('Cocoapods', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                          Container(
                                              child: Text('Core Data', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                          Container(
                                              child: Text('Networking', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),)),
                                        ],)
                                    ],),
                                    SizedBox(height: 60,),


                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],)



                    ],
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
                  height: 300,//screenWidth < 1173 ? 300 + c : 300 -c,//screenWidth * 0.2123,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 30,top: 18.0),
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
                                  Text('github.com/LevMartens     ', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0,top: 18.0),
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
                                  Text('Stackoverflow               ', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),
                                ],
                              ),
                            )),
                      ),

                    ],
                  ),
                ),

              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeMobileLandscape extends StatefulWidget {

  HomeMobileLandscape({
    Key key,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _HomePageStateLandscape();
}

class _HomePageStateLandscape extends State<HomeMobileLandscape> {
  bool aboutMeSelected = false;
  bool verossaSelected = false;
  final _scrollController = ScrollController(keepScrollOffset: false);
  AnimationController animationControllerForTest;
  AnimationController animationControllerForAboutMe;
  AnimationController animationControllerForPortfolio;
  AnimationController animationControllerForPhone;
  AnimationController animationControllerForTPhone;
  AnimationController animationControllerForVTitle;
  AnimationController animationControllerForTTitle;
  AnimationController animationControllerForMoreAbout;
  AnimationController animationControllerForMoreVerossa;

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
  _launchLinkedInURL() async {
    const url = 'https://au.linkedIn.com/in/levmartens';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {

    bool startAnimation = false;
    var orientation = MediaQuery.of(context).orientation;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width; //orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width - 250;
    var halfScreenWidth = screenWidth / 2;
    var oneThirdSW = screenWidth / 20;
    double a = 0 - screenWidth;
    double b = -a ;
    double c = 1173 - screenWidth;
    var children = [
      Container(

        width: screenWidth,
        height: screenWidth * 0.5123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/road.jpg')),
      ),

    ];
    var childrenBottom = [
      Container(

        width: screenWidth,
        height: 300,//screenWidth < 1173 ? 300 + c : 300 -c,//screenWidth * 0.2123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/background1.png')),
      ),

    ];
    print("screenwidth: $screenWidth");


    double verossaACHeight() {
      if(verossaSelected == true && screenWidth < 1025) { return 2000;}
      if(verossaSelected == true && screenWidth > 1025) { return 1010;}
      if(verossaSelected == false) { return 0;}
    }
    double aboutMeACHeight() {
      if(aboutMeSelected == true && screenWidth < 1025) { return 830;}
      if(aboutMeSelected == true && screenWidth > 1025) { return 580;}
      if(aboutMeSelected == false) { return 0;}
    }


    return Scaffold(

      body: Container(
        height: 2400,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
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
                                        child: Text(Texts.aboutMe,

                                          style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: Texts.fontSize, fontWeight: FontWeight.w500),),
                                      ),
                                      SizedBox(height: 25,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 150.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            if(aboutMeSelected == false) {
                                              setState(() {
                                                aboutMeSelected = true;
                                              });
                                            } else {



                                              setState(() {
                                                aboutMeSelected = false;
                                              });


                                            }
                                          },
                                          child: Container(
                                              margin: const EdgeInsets.all(15.0),
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black26)
                                              ),
                                              child: Text('More about me', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                        ),
                                      ),
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
                      child: AnimatedContainer(
                        //color: Colors.black12,
                        decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black, width: 10), right: BorderSide(color: Colors.black, width: 10))),



                        height: aboutMeACHeight(),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                        child: VisibilityDetector(

                          key: Key('MoreAbout'),

                          onVisibilityChanged: (visibilityInfo) {
                            var visiblePercentage = visibilityInfo.visibleFraction * 100;
                            debugPrint(
                                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                            if(visiblePercentage > 10) {
                              print('>10');
                              animationControllerForMoreAbout.forward();
                            }
                            if(visiblePercentage == 0) {
                              print('<50');
                              animationControllerForMoreAbout.reverse();
                            }

                          },
                          child: FadeIn(
                            duration: Duration(milliseconds: 700),
                            manualTrigger: true,
                            animate: false,
                            controller: ( controller ) => animationControllerForMoreAbout = controller,

                            child: screenWidth > 1025 ? Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: aboutMeSelected == true ? Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Row(
                                          children: [

                                            Container(

                                                height: 150,
                                                width: 110,

                                                child: Image.asset('assets/IMG_0888.png')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Personal Life', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 300,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40, top: 50),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(

                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8484.JPG')),
                                                Container(


                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8181.JPG')),
                                              ],
                                            ),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Work History', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 300,
                                                    child: Text('Add linkedin link Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:25.0, right: 170),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _launchLinkedInURL();
                                                      },
                                                      child: Container(
                                                        child: Text('LinkedIn Page', style: TextStyle(decoration: TextDecoration.underline,fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),),
                                                      ),
                                                    ),
                                                  )
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
                                        padding: const EdgeInsets.only(top:30),
                                        child: Row(
                                          children: [

                                            Container(

                                                height: 200,
                                                width: 180,

                                                child: Image.asset('assets/music.png')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Hobbies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(

                                                    width: 300,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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
                                      if(aboutMeSelected == false) {
                                        setState(() {
                                          aboutMeSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          aboutMeSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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
                              child: aboutMeSelected == true ? Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Row(
                                          children: [

                                            Container(

                                                height: 150,
                                                width: 110,

                                                child: Image.asset('assets/IMG_0888.png')),
                                            SizedBox(width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Personal Life', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 300,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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
                                        padding: const EdgeInsets.only(left: 0, top: 50),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(

                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8484.JPG')),
                                                Container(


                                                    height: 110,
                                                    width: 110,

                                                    child: Image.asset('assets/IMG_8181.JPG')),
                                              ],
                                            ),
                                            SizedBox(width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Work History', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    width: 300,
                                                    child: Text('Add linkedin link Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:25.0, right: 170),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _launchLinkedInURL();
                                                      },
                                                      child: Container(
                                                        child: Text('LinkedIn Page', style: TextStyle(decoration: TextDecoration.underline,fontFamily: 'Cormorant',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),),
                                                      ),
                                                    ),
                                                  )
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
                                        padding: const EdgeInsets.only(top:30, right: 40),
                                        child: Row(
                                          children: [

                                            Container(

                                                height: 200,
                                                width: 150,

                                                child: Image.asset('assets/music.png')),
                                            SizedBox(width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only( right: 150.0),
                                                    child: Text('Hobbies', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Container(

                                                    width: 300,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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
                                      if(aboutMeSelected == false) {
                                        setState(() {
                                          aboutMeSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          aboutMeSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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
                        ),
                      )),




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

                        child: Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Text('PORTFOLIO', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 45, fontWeight: FontWeight.w500),),
                        ),
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
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Container(

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),

                                          height: 40,
                                          width: 40,

                                          child: Image.asset('assets/TestFlight_Icon.png')),
                                      SizedBox(width: 10,),
                                      Container(
                                          child: Text('Available on TestFlight', style: TextStyle(fontFamily: 'Cormorant',color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),)),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  GestureDetector(
                                    onTap: (){
                                      if(verossaSelected == false) {
                                        setState(() {
                                          verossaSelected = true;
                                        });
                                      } else {
                                        setState(() {
                                          verossaSelected = false;
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
                                  padding: EdgeInsets.only(left: screenWidth > 726 ? 150.0 : 60),
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
                      //color: Colors.white,
                        decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black, width: 10), right: BorderSide(color: Colors.black, width: 10))),


                        height: verossaACHeight(),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                        child: VisibilityDetector(

                          key: Key('MoreVerossa'),

                          onVisibilityChanged: (visibilityInfo) {
                            var visiblePercentage = visibilityInfo.visibleFraction * 100;
                            debugPrint(
                                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                            if(visiblePercentage > 10) {
                              print('>10');
                              animationControllerForMoreVerossa.forward();
                            }
                            if(visiblePercentage == 0) {
                              print('<50');
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

                                                child: Image.asset('assets/screenshot4.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot3.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot5.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot6.jpg')),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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
                                        setState(() {
                                          verossaSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          verossaSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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

                                                child: Image.asset('assets/screenshot4.jpg')),
                                            SizedBox(width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot3.jpg')),
                                            SizedBox(width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot5.jpg')),
                                            SizedBox(width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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

                                                child: Image.asset('assets/screenshot6.jpg')),
                                            SizedBox(width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 0.0),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 200,
                                                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet ',

                                                      style: TextStyle(height: 1.5,fontFamily: 'Cormorant',color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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
                                        setState(() {
                                          verossaSelected = true;
                                        });
                                      } else {



                                        setState(() {
                                          verossaSelected = false;
                                        });


                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Container(
                                        //margin: const EdgeInsets.all(15.0),
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
                              padding: EdgeInsets.only(left: screenWidth > 727 ? 150 : 60, right: screenWidth > 640 ? 110 : 70),
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
                  height: 300,//screenWidth < 1173 ? 300 + c : 300 -c,//screenWidth * 0.2123,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 30,top: 18.0),
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
                                  Text('github.com/LevMartens     ', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0,top: 18.0),
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
                                  Text('Stackoverflow               ', style: TextStyle(fontFamily: 'Cormorant',color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),
                                ],
                              ),
                            )),
                      ),

                    ],
                  ),
                ),

              ]),
            ],
          ),
        ),
      ),
    );
  }
}
