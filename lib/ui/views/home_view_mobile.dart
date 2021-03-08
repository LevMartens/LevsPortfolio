import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lev_martens/ui/provider/value_provider.dart';
import 'package:lev_martens/ui/widgets/Mobile_Portrait_Widgets/About_Me_Portrait_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Portrait_Widgets/Java_Portrait_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Landscape_Widgets/About_Me_Mobile_Widget.dart';
import 'package:lev_martens/ui/widgets/Bottom_Header_Widget.dart';
import 'package:lev_martens/ui/widgets/Header_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Landscape_Widgets/Java_Mobile_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Landscape_Widgets/Portfolio_Title_Mobile_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Landscape_Widgets/Verossa_Mobile_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Landscape_Widgets/Vocabex_Mobile_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Portrait_Widgets/Portfolio_Title_Portrait_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Portrait_Widgets/Verossa_Portrait_Widget.dart';
import 'package:lev_martens/ui/widgets/Mobile_Portrait_Widgets/Vocabex_Portrait_Widget.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lev_martens/Data.dart';

class HomeMobileLandscape extends StatefulWidget {

  HomeMobileLandscape({
    Key key,
  }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _HomePageStateL();
}

class _HomePageStateL extends State<HomeMobileLandscape> {
  bool aboutMeSelected = false;
  bool verossaSelected = false;
  bool vocabexSelected = false;
  
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

    aboutMeSelected = Provider.of<ValueProvider>(context, listen: true).aboutMeSelectedMobile;
    vocabexSelected = Provider.of<ValueProvider>(context, listen: true).vocabexSelectedMobile;
    verossaSelected = Provider.of<ValueProvider>(context, listen: true).verossaSelectedMobile;
    
    onMobile = true;
   
    var screenWidth = MediaQuery.of(context).size.width; 
    
    double totalACHeightAbove1025() {
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == false) { return 3835;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == true) { return 6465;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == false) { return 5455;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == false) { return 4845;}
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == true) { return 4845;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == false) { return 6465;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == true) { return 6465;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == true) { return 5855;}
      else {return 0;}
    }
    
    double totalACHeightBelow1025() {
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == false) { return 3877;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == true) { return 11057;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == false) { return 5371;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == false) { return 6150;}
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == true) { return 7290;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == false) { return 7644;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == true) { return 8784;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == true) { return 9563;}
      else {return 0;}
    }
    
    return Scaffold(
      body: Container(
        height: 3000,
        color: Colors.white,
        child: Stack(
            children: [
              Header(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenWidth * 0.5123,
                      color: Colors.transparent,
                    ),
                    Container(
                      height:  screenWidth > 1025 ? totalACHeightAbove1025() : totalACHeightBelow1025(),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AboutMeMobile(),
                              PortfolioTitleMobile(),
                              VocabexMobile(),
                              VerossaMobile(),
                              JavaMobile()
                            ],),
                          BottomHeader(),
                        ],),
                    ),
                  ],),
              ),]
        ),
      ),
    );
  }
}

class HomeMobilePortrait extends StatefulWidget {

  HomeMobilePortrait({
    Key key,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeMobilePortrait> {
  bool aboutMeSelected = false;
  bool verossaSelected = false;
  bool vocabexSelected = false;

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
    aboutMeSelected = Provider.of<ValueProvider>(context, listen: true).aboutMeSelectedPortrait;
    vocabexSelected = Provider.of<ValueProvider>(context, listen: true).vocabexSelectedPortrait;
    verossaSelected = Provider.of<ValueProvider>(context, listen: true).verossaSelectedPortrait;

    onMobile = true;

    var screenWidth = MediaQuery.of(context).size.width;

    double totalACHeightAbove1025() {
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == false) { return 2397;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == true) { return 5027;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == false) { return 3007;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == false) { return 5282;}
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == true) { return 3407;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == false) { return 4017;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == true) { return 4017;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == true) { return 4417;}
      else {return 0;}
    }
    double totalACHeightBelow1025() {
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == false) { return 3919;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == true) { return 11099;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == false) { return 5413;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == false) { return 6192;}
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == true) { return 7332;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == false) { return 7686;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == true) { return 8826;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == true) { return 9605;}
      else {return 0;}
    }

    return Scaffold(
      body: Container(
        height: 3000,
        color: Colors.white,
        child: Stack(
            children: [
              Header(),
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
                              AboutMePortrait(),
                              PortfolioTitlePortrait(),
                              VocabexPortrait(),
                              VerossaPortrait(),
                              JavaPortrait(),
                            ],
                          ),
                          BottomHeader(),
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