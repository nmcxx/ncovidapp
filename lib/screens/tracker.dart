import 'package:flutter/material.dart';
import 'package:ncovidapp/utils/constants.dart';


class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
