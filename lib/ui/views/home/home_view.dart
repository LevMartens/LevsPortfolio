import 'package:flutter/material.dart';
import 'package:lev_martens/ui/base_widget.dart';
import 'package:lev_martens/ui/orientation_layout.dart';
import 'package:lev_martens/ui/screen_type_layout.dart';
import 'home_view_mobile.dart';
import 'home_view_tablet.dart';
import 'home_view_desktop.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        desktop: HomeDesktop(),
        tablet: HomeTablet(),
        mobile: OrientationLayout(
          portrait: HomeMobilePortrait(),
          landscape: HomeMobileLandscape(),
    ));

  }
}
