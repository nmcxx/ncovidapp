import 'package:flutter/material.dart';
import 'package:ncovidapp/screens/tinh.dart';
import 'package:ncovidapp/screens/vietnam.dart';
import 'package:ncovidapp/utils/constants.dart';
import 'navigation_option.dart';

enum NavigationStatus{
  VIETNAM,
  TINH,
}

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.VIETNAM;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          "nCovid Vietnam Data",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
              child: Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )
                ),
                child: AnimatedSwitcher(
                  duration: Duration(microseconds: 250),
                  child: navigationStatus == NavigationStatus.VIETNAM ? Vietnam() : Tinh(),
                ),
              ),
          ),

          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                NavigationOption(
                    title: "Việt Nam",
                    selected: navigationStatus == NavigationStatus.VIETNAM,
                    onSelected: () {
                      setState(() {
                        navigationStatus = NavigationStatus.VIETNAM;
                      });
                    }),


                NavigationOption(
                    title:  "Tỉnh/Thành Phố",
                    selected: navigationStatus == NavigationStatus.TINH,
                    onSelected: () {
                      setState(() {
                        navigationStatus = NavigationStatus.TINH;
                      });
                    }),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
