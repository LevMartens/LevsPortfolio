import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lev_martens/ui/provider/value_provider.dart';
import 'package:lev_martens/ui/widgets/About_Me_Tablet_Widget.dart';
import 'package:lev_martens/ui/widgets/Bottom_Header_Widget.dart';
import 'package:lev_martens/ui/widgets/Header_Widget.dart';
import 'package:lev_martens/ui/widgets/Java_Tablet_Widget.dart';
import 'package:lev_martens/ui/widgets/Portfolio_Title_Tablet_Widget.dart';
import 'package:lev_martens/ui/widgets/Verossa_Tablet_Widget.dart';
import 'package:lev_martens/ui/widgets/Vocabex_Tablet_Widget.dart';
import 'package:provider/provider.dart';
import 'package:lev_martens/Data.dart';

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
     aboutMeSelected = Provider.of<ValueProvider>(context, listen: true).aboutMeSelectedTablet;
     verossaSelected = Provider.of<ValueProvider>(context, listen: true).verossaSelectedTablet;
     vocabexSelected = Provider.of<ValueProvider>(context, listen: true).vocabexSelectedTablet;

    var screenWidth = MediaQuery.of(context).size.width;

    double totalACHeightAbove1025() {
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == false) { return 2345;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == true) { return 4975;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == false) { return 2955;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == false) { return 3355;}
      if(aboutMeSelected == false && vocabexSelected == false && verossaSelected == true) { return 3355;}
      if(aboutMeSelected == true && vocabexSelected == true && verossaSelected == false) { return 3965;}
      if(aboutMeSelected == true && vocabexSelected == false && verossaSelected == true) { return 3965;}
      if(aboutMeSelected == false && vocabexSelected == true && verossaSelected == true) { return 4365;}
      else {return 0;}
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
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AboutMeTablet(),
                              PortfolioTitleTablet(),
                              VocabexTablet(),
                              VerossaTablet(),
                              JavaTablet(),
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