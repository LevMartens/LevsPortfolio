//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:lev_martens/ui/views/home/home_view.dart';
//import 'package:device_preview/device_preview.dart';
void main() {
  runApp(MyApp()); //DevicePreview(builder: (context) =>
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}


