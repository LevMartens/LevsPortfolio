import 'package:flutter/material.dart';
import 'package:lev_martens/ui/base_widget.dart';
import 'package:lev_martens/ui/sizing_information.dart';
import 'package:lev_martens/enums/device_screen_type.dart';
import 'package:lev_martens/widgets/app_drawer.dart';

class HomeDesktop extends StatelessWidget {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      //drawer: AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2300,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(
                  children: <Widget>[
                    Stack(children: [


                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.5123,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset('assets/road.jpg')),
                      ),
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.5123,
                        color: Colors.black45,
                      ),
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.5123,
                        child: Center(child: Text('HELLO WORLD',style: TextStyle(color: Colors.white, fontSize: 25),)),)

                    ]),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
