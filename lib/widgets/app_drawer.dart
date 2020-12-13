import 'package:flutter/material.dart';
import 'package:lev_martens/ui/base_widget.dart';
import 'package:lev_martens/ui/orientation_layout.dart';
import 'package:lev_martens/ui/screen_type_layout.dart';
import 'package:lev_martens/widgets/app_drawer_mobile.dart';
//import 'home_view_mobile.dart';
import 'package:lev_martens/widgets/app_drawer_tablet.dart';
import 'drawer_option.dart';

class AppDrawer extends StatelessWidget {

  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayout(
        portrait: AppDrawerTabletPortrait(),
        landscape: AppDrawerTabletLandscape(),
      ),);
  }

  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Images',
        iconData: Icons.image,
      ),
      DrawerOption(
        title: 'Reports',
        iconData: Icons.photo_filter,
      ),
      DrawerOption(
        title: 'Incidents',
        iconData: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
      ),
    ];
  }
}