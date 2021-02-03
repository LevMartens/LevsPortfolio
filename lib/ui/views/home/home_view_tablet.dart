import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lev_martens/widgets/app_drawer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lev_martens/Texts.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeTablet extends StatefulWidget {

   HomeTablet({
    Key key,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeTablet> {
  bool aboutMeSelected = false;
  bool verossaSelected = false;
  bool vocabexSelected = false;
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
  AnimationController animationControllerForMoreVocabex;
  AnimationController animationControllerForVocabex;
  AnimationController animationControllerForVocabexPhone;
  AnimationController animationControllerForJava;
  AnimationController animationControllerForJavaPhone;
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
  _launchJavaQuiz() async {
    const url = 'https://play.google.com/store/apps/details?id=com.levmartens.melbournequizzapp';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


@override
  void didChangeDependencies() {
  precacheImage(Images.aboutMe, context);
  precacheImage(Images.firstStackImage, context);
  precacheImage(Images.lastStackImage, context);
  precacheImage(Images.personalLife, context);
  precacheImage(Images.workHistory1, context);
  precacheImage(Images.workHistory2, context);
  precacheImage(Images.hobbies, context);
  precacheImage(Images.testFlightIcon, context);
  precacheImage(Images.screenshotHomePage, context);
  precacheImage(Images.screenshot1, context);
  precacheImage(Images.screenshot2, context);
  precacheImage(Images.screenshot3, context);
  precacheImage(Images.screenshot4, context);
  precacheImage(Images.screenshotComingSoon, context);
    super.didChangeDependencies();
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
            child: Image(image: Images.firstStackImage)),
      ),

    ];
    var childrenBottom = [
      Container(

        width: screenWidth,
        height: 300,//screenWidth < 1173 ? 300 + c : 300 -c,//screenWidth * 0.2123,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image(image: Images.lastStackImage )),
      ),

    ];
    print("screenwidth: $screenWidth");


    double verossaACHeight() {
      if(verossaSelected == true && screenWidth < 1025) { return 2000;}
      if(verossaSelected == true && screenWidth > 1025) { return 1010;}
      if(verossaSelected == false) { return 0;}
    }
    double vocabexACHeight() {
      if(vocabexSelected == true && screenWidth < 1025) { return 1500;}
      if(vocabexSelected == true && screenWidth > 1025) { return 1010;}
      if(vocabexSelected == false) { return 0;}
    }
    double aboutMeACHeight() {
      if(aboutMeSelected == true && screenWidth < 1025) { return 810;}
      if(aboutMeSelected == true && screenWidth > 1025) { return 610;}
      if(aboutMeSelected == false) { return 0;}
    }

    double totalACHeightAbove1025() {
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == false) { return 2345;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == true) { return 4975;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == false) { return 2955;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == false) { return 3355;}
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == true) { return 3355;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == false) { return 3965;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == true) { return 3965;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == true) { return 4365;}

    }
    double totalACHeightBelow1025() {
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == false) {  return 2345;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == true) { return 6655;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == false) { return 3155;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == false) { return 3845;}
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == true) { return 4345;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == false) { return 4655;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == true) { return 5155;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == true) { return 4855;}

    }




    return Scaffold(

      body: Container(
        height: 3000,
        color: Colors.white,
        child: Stack(
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
                    
                    Text('Lev Martens.',style: WordStyle.header),
                    Text('Swift, Java and Flutter Enthusiast ',style: WordStyle.headerSecond),
                  ],
                )),),





            ]),

            SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenWidth * 0.5123,
                  color: Colors.transparent,
                ),
                Container(
                  height: screenWidth > 1025 ? totalACHeightAbove1025() : totalACHeightBelow1025(),
                  color: Colors.white,
                  child: Column(
                    children: [

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
                                                    image: Images.aboutMe
                                                )

                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 120.0),
                                                child: Text('ABOUT ME', style: WordStyle.style20_300),
                                              ),
                                              SizedBox(height: 25,),
                                              Container(
                                                width: 375,
                                                child: Text(Texts.aboutMe,

                                                  style: WordStyle.general),
                                              ),
                                              SizedBox(height: 25,),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 120.0),
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
                                                      child: Text('More about me', style: WordStyle.more)),
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

                                                          child: Image(image:Images.personalLife)),
                                                      SizedBox(width: 20,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 0.0),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only( right: 150.0),
                                                              child: Text('Personal Life', style: WordStyle.style20_300),
                                                            ),
                                                            SizedBox(height: 25,),
                                                            Container(
                                                              width: 300,
                                                              child: Text(Texts.personalLife,

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
                                                  padding: const EdgeInsets.only(left: 40, top: 50),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(

                                                              height: 110,
                                                              width: 110,

                                                              child: Image(image:Images.workHistory1)),
                                                          Container(


                                                              height: 110,
                                                              width: 110,

                                                              child: Image(image:Images.workHistory2)),
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 0.0),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only( right: 150.0),
                                                              child: Text('Work History', style: WordStyle.style20_300),
                                                            ),
                                                            SizedBox(height: 25,),
                                                            Container(
                                                              width: 300,
                                                              child: Text(Texts.workHistory,

                                                                style: WordStyle.general),
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.only(top:25.0, right: 170),
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  _launchLinkedInURL();
                                                                },
                                                                child: Container(
                                                                  child: Text('LinkedIn Page', style: WordStyle.linkedIn),
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


                                                          child: Image(image:Images.hobbies)),
                                                      SizedBox(width: 20,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 0.0),
                                                        child: Column(

                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only( right: 150.0),
                                                              child: Text('Hobbies', style: WordStyle.style20_300),
                                                            ),
                                                            SizedBox(height: 25,),
                                                            Container(

                                                              width: 300,
                                                              child: Text(Texts.hobbies,

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

                                                          child: Image(image: Images.personalLife)),
                                                      SizedBox(width: 70,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 0.0),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only( right: 190.0),
                                                              child: Text('Personal Life', style: WordStyle.style20_300),
                                                            ),
                                                            SizedBox(height: 25,),
                                                            Container(
                                                              width: 300,
                                                              child: Text(Texts.personalLife,

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
                                                  padding: const EdgeInsets.only(left: 0, top: 50),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(

                                                              height: 110,
                                                              width: 110,

                                                              child: Image(image: Images.workHistory1)),
                                                          Container(


                                                              height: 110,
                                                              width: 110,

                                                              child: Image(image:Images.workHistory2)),
                                                        ],
                                                      ),
                                                      SizedBox(width: 70,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 0.0),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only( right: 190.0),
                                                              child: Text('Work History', style: WordStyle.style20_300),
                                                            ),
                                                            SizedBox(height: 25,),
                                                            Container(
                                                              width: 300,
                                                              child: Text(Texts.workHistory,

                                                                style: WordStyle.general),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top:25.0, right: 220),
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  _launchLinkedInURL();
                                                                },
                                                                child: Container(
                                                                  child: Text('LinkedIn Page', style: WordStyle.linkedIn),
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

                                                          child: Image(image:Images.hobbies)),
                                                      SizedBox(width: 70,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 0.0),
                                                        child: Column(

                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only( right: 235.0),
                                                              child: Text('Hobbies', style:  WordStyle.style20_300),
                                                            ),
                                                            SizedBox(height: 25,),
                                                            Container(

                                                              width: 300,
                                                              child: Text(Texts.hobbies,

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
                                  child: Text('PORTFOLIO', style: WordStyle.portfolio),
                                ),
                              ),
                            ),
                          ),

                          //Vocabex
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //slight delay in fade in
                              Center(
                                child: VisibilityDetector(

                                  key: Key('VocabexTitle'),

                                  onVisibilityChanged: (visibilityInfo) {
                                    var visiblePercentage = visibilityInfo.visibleFraction * 100;
                                    debugPrint(
                                        'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
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
                                              child: Text(Texts.vocabexDescription, style: WordStyle.general,)),
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
                                                  setState(() {

                                                    vocabexSelected = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    vocabexSelected = false;

                                                  });
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
                                            'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
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
                              //color: Colors.white,
                                decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black, width: 10), right: BorderSide(color: Colors.black, width: 10))),


                                height: vocabexACHeight(),
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                                child: VisibilityDetector(

                                  key: Key('MoreVocabex'),

                                  onVisibilityChanged: (visibilityInfo) {
                                    var visiblePercentage = visibilityInfo.visibleFraction * 100;
                                    debugPrint(
                                        'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
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
                                                        child: Text(Texts.vocabexSS3,

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
                                                              child: Text(Texts.vocabexSS2,

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
                                                        child: Text(Texts.vocabexSS4,

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
                                                setState(() {
                                                  vocabexSelected = true;
                                                });
                                              } else {



                                                setState(() {
                                                  vocabexSelected = false;
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
                                                            child: Text(Texts.vocabexSS3,

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
                                                            child: Text(Texts.vocabexSS2,

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
                                                            child: Text(Texts.vocabexSS4,

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
                                                setState(() {
                                                  vocabexSelected = true;
                                                });
                                              } else {



                                                setState(() {
                                                  vocabexSelected = false;
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


                          //Verossa
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

                                                      child: Text('Verossa Valey', style: WordStyle.appTitle)),
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

                                              child: Text(Texts.verossaDescription, style: WordStyle.general,)),
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

                                                        child: Image(image:Images.screenshot1)),
                                                    SizedBox(width: 20,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 0.0),
                                                      child: Column(
                                                        children: [

                                                          Container(
                                                            width: 200,
                                                            child: Text(Texts.screenshot1,

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
                                                            child: Text(Texts.screenshot2,

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
                                                            child: Text(Texts.screenshot3,

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
                                                            child: Text(Texts.screenshot4,

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

                                                        child: Image(image: Images.screenshot1)),
                                                    SizedBox(width: 50,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 0.0),
                                                      child: Column(
                                                        children: [

                                                          Container(
                                                            width: 200,
                                                            child: Text(Texts.screenshot1,

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
                                                            child: Text(Texts.screenshot2,

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
                                                            child: Text(Texts.screenshot3,

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
                                                            child: Text(Texts.screenshot4,

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




                          //Java Quiz
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //slight delay in fade in
                              Center(
                                child: VisibilityDetector(

                                  key: Key('javaTitle'),

                                  onVisibilityChanged: (visibilityInfo) {
                                    var visiblePercentage = visibilityInfo.visibleFraction * 100;
                                    debugPrint(
                                        'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                                    if(visiblePercentage > 10) {
                                      print('>10');
                                      animationControllerForJava.forward();
                                    }
                                    if(visiblePercentage == 0) {
                                      print('<50');
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

                                              child: Text(Texts.javaDescription, style: WordStyle.general,)),
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
                                            onTap: () {_launchJavaQuiz();},
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
                                        debugPrint(
                                            'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                                        if(visiblePercentage > 10) {
                                          print('>10');
                                          animationControllerForJavaPhone.forward();
                                        }
                                        if(visiblePercentage == 0) {
                                          print('<50');
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

                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),]
        ),
      ),
    );
  }
}


