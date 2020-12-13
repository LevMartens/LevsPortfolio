import 'package:flutter/material.dart';
import 'package:lev_martens/ui/base_widget.dart';
import 'package:lev_martens/ui/sizing_information.dart';
import 'package:lev_martens/enums/device_screen_type.dart';

class OrientationLayout extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;
  OrientationLayout({
    Key key,
    this.landscape,
    @required this.portrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return landscape ?? portrait;
    }

    return portrait;
  }
}