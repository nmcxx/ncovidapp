import 'package:flutter/material.dart';
import 'package:ncovidapp/services/covid_service.dart';


class Tinh extends StatefulWidget {
  @override
  _TinhState createState() => _TinhState();
}

class _TinhState extends State<Tinh> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Text(
                "Dữ liệu Corona Virus Các Tỉnh Việt Nam",
                style: TextStyle(
                    fontFamily: 'Tahoma',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                ),
              ),
              
              Icon(
                Icons.refresh,
                color: Colors.white,
              ),

            ],
          ),
        ),

      ],
    );
  }
}

