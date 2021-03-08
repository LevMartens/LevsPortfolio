import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lev_martens/ui/provider/value_provider.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../Data.dart';

class AboutMePortrait extends StatefulWidget {
  @override
  _AboutMePortraitState createState() => _AboutMePortraitState();
}

class _AboutMePortraitState extends State<AboutMePortrait> {
  AnimationController animationControllerForAboutMe;
  AnimationController animationControllerForMoreAbout;
  bool aboutMeSelected = false;

  @override
  Widget build(BuildContext context) {
    aboutMeSelected = Provider.of<ValueProvider>(context, listen: true).aboutMeSelectedPortrait;
    var screenWidth = MediaQuery.of(context).size.width;
    double aboutMeACHeight() {
      if(aboutMeSelected == true && screenWidth < 1025) { return 1494;}
      if(aboutMeSelected == true && screenWidth > 1025) { return 610;}
      if(aboutMeSelected == false) { return 0;} else {return 0;}
    }

    return Column(children: [
      SizedBox(height: 100,),
      Center(
        child: VisibilityDetector(
          key: Key('About Me'),
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;
            debugPrint(
                'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
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
                height: 585,
                width: 600,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Container(
                          height: 150,
                          width: 150,
                          child: Image(image: Images.aboutMe)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text('ABOUT ME', style: WordStyle.style20_300),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            width: 220,
                            child: Text(Strings.aboutMe,
                                style: WordStyle.general),
                          ),
                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: (){
                                if(aboutMeSelected == false) {
                                  Provider.of<ValueProvider>(context, listen: false).changeAboutMeSelectedPortraitTo(true);
                                } else {
                                  Provider.of<ValueProvider>(context, listen: false).changeAboutMeSelectedPortraitTo(false);
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
                    'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
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
                                        padding: const EdgeInsets.only( right: 110.0),
                                        child: Text('Competencies and skills', style: WordStyle.style20_300),
                                      ),
                                      SizedBox(height: 25,),
                                      Container(
                                        width: 300,
                                        child: Text(Strings.personalLife,
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
                                        child: Text(Strings.workHistory,
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
                                        child: Text(Strings.hobbies,
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
                            Provider.of<ValueProvider>(context, listen: false).changeAboutMeSelectedPortraitTo(true);
                          } else {
                            Provider.of<ValueProvider>(context, listen: false).changeAboutMeSelectedPortraitTo(false);
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
                            child: Column(
                              children: [
                                Container(
                                    height: 150,
                                    width: 110,
                                    child: Image(image: Images.personalLife)),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only( right: 0.0),
                                        child: Text('Competencies and skills', style: WordStyle.style20_300),
                                      ),
                                      SizedBox(height: 25,),
                                      Container(
                                        width: 220,
                                        child: Text(Strings.personalLife,
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
                            padding: const EdgeInsets.only(left: 0, top: 70),
                            child: Column(
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
                                SizedBox(height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only( right: 0.0),
                                        child: Text('Work History', style: WordStyle.style20_300),
                                      ),
                                      SizedBox(height: 25,),
                                      Container(
                                        width: 220,
                                        child: Text(Strings.workHistory,
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
                            padding: const EdgeInsets.only(top:80),
                            child: Column(
                              children: [
                                Container(
                                    height: 200,
                                    width: 150,
                                    child: Image(image:Images.hobbies)),
                                SizedBox(height: 0,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only( top: 20,right: 0.0),
                                        child: Text('Hobbies', style:  WordStyle.style20_300),
                                      ),
                                      SizedBox(height: 25,),
                                      Container(
                                        width: 220,
                                        child: Text(Strings.hobbies,
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
                            Provider.of<ValueProvider>(context, listen: false).changeAboutMeSelectedPortraitTo(true);
                          } else {
                            Provider.of<ValueProvider>(context, listen: false).changeAboutMeSelectedPortraitTo(false);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70.0),
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
            ),
          )),
    ],);
  }
}
