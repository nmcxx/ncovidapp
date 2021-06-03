import 'package:flutter/material.dart';
import 'package:ncovidapp/utils/constants.dart';
import 'package:ncovidapp/models/covid_summary.dart';

class VietnamStatistics extends StatelessWidget {

  final CovidSummaryModel summary;


  VietnamStatistics({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
          "TỔNG SỐ CA NHIỄM",
          summary.cases,
          kCaseColor,
        ),

        buildCard(
          "ĐANG ĐIỀU TRỊ",
          summary.healthCare,
          kHealthCareColor,
        ),

        buildCard(
          "KHỎI",
          summary.recovered,
          kRecoveredColor,
        ),

        buildCard(
          "TỬ VONG",
          summary.deaths,
          kDeathColor,
        ),
      ],
    );
  }

  Widget buildCard(String title, int totalCount, Color color)
  {
    return Card(
      elevation: 1,
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[

            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),

                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }

}
