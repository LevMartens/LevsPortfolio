import 'package:flutter/material.dart';
import 'package:lev_martens/ui/orientation_layout.dart';
import 'package:lev_martens/ui/screen_type_layout.dart';
import 'drawer_option_mobile.dart';
import 'drawer_option_tablet.dart';


class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  const DrawerOption({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: DrawerOptionMobilePortrait(title: title, iconData: iconData,),
        landscape: DrawerOptionMobileLandscape(iconData: iconData,),
      ),
      tablet: OrientationLayout(
        portrait: DrawerOptionTabletPortrait(title: title, iconData: iconData,),
        landscape: DrawerOptionMobilePortrait(iconData: iconData, title: title,),
      ),
    );
  }
}