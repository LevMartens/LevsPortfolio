import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../Data.dart';

class PortfolioTitlePortrait extends StatefulWidget {
  @override
  _PortfolioTitlePortraitState createState() => _PortfolioTitlePortraitState();
}

class _PortfolioTitlePortraitState extends State<PortfolioTitlePortrait> {
  AnimationController animationControllerForPortfolio;
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
