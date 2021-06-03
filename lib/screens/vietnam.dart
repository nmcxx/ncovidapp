import 'package:flutter/material.dart';
import 'package:ncovidapp/services/covid_service.dart';
import 'package:ncovidapp/models/covid_summary.dart';
import 'vietnam_statistics.dart';
import 'vietnam_loading.dart';

CovidService covidService = CovidService();

class Vietnam extends StatefulWidget {
  @override
  _VietnamState createState() => _VietnamState();
}

class _VietnamState extends State<Vietnam> {

  Future<CovidSummaryModel>? summary;


  @override
  void initState() {
    super.initState();
    summary = covidService.getSummaryData();
  }

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
                "Dữ liệu Corona Virus Việt Nam",
                style: TextStyle(
                  fontFamily: 'Tahoma',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              GestureDetector(
                onTap: (){
                  setState(() {
                    summary = covidService.getSummaryData();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),

        FutureBuilder(
          future: summary,
          builder: (context, snapshot){
            if(snapshot.hasError)
              return Center(child: Text("Error"),);
            switch(snapshot.connectionState)
            {
              case ConnectionState.waiting:
                // return Center(child: Text("Loading"),);
                return VietnamLoading();
              default:
                return !snapshot.hasData
                    ? Center(child: Text("Empty"),)
                    : VietnamStatistics(
                        summary: snapshot.data as CovidSummaryModel,
                );
            }
          },
        ),

      ],
    );
  }
}
