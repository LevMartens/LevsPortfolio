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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _scrollController = ScrollController(keepScrollOffset: false);



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverFixedExtentList(
              itemExtent: 2300,
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.white70,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                      children: <Widget>[


                    Container(
                      height: 800,
                      width: 1200,
                      child: FittedBox(
                        fit: BoxFit.fill,
                          child: Image.asset('assets/lev_martens_master.jpg')),)

                  ]),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
