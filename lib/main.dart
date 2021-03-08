import 'package:flutter/material.dart';
import 'package:lev_martens/ui/provider/value_provider.dart';
import 'package:lev_martens/ui/views/home_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ValueProvider>(
              create: (context) => ValueProvider()),
        ],
        child: Consumer<ValueProvider>(
            builder: (context, valuePV, child) => MaterialApp(
                  title: 'Lev\'s Portfolio',
                  //builder: DevicePreview.appBuilder,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home: HomeView(),
                )));
  }
}
