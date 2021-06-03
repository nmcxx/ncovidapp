import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncovidapp/screens/vietnam_loading.dart';
import 'package:ncovidapp/screens/vietnam_statistics.dart';
import 'package:ncovidapp/services/covid_service.dart';
import 'package:ncovidapp/models/province.dart';
import 'package:ncovidapp/models/covid_summary.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

CovidService covidService = CovidService();

class Tinh extends StatefulWidget {
  @override
  _TinhState createState() => _TinhState();
}

class _TinhState extends State<Tinh> {

  final TextEditingController _typeAheadController = TextEditingController();
  Future<List<ProvinceModel>>? proList;
  Future<CovidSummaryModel>? proSummary;


  @override
  void initState() {
    super.initState();

    proList = covidService.getProvinces();
    proSummary = covidService.getProvinceData("hanoi");

    this._typeAheadController.text = "Hà Nội";
  }

  List<String> _getSuggestions(List<ProvinceModel> list, String query)
  {
    List<String> matches = [];

    for(var item in list){
      matches.add(item.fullname);
    }


    matches.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: proList,
      builder: (context, snapshot){
        if(snapshot.hasError)
          return Center(child: Text("Error"),);
        switch (snapshot.connectionState)
        {
          case ConnectionState.waiting:
            return Center(child: Text("Loading"),);
          default:
            return !snapshot.hasData
                ? Center(child: Text("Empty"),)
                : Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  child: Text(
                    "Nhập tên tỉnh/thành phố",
                    style: TextStyle(
                      fontFamily: 'Tahoma',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),

                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: _typeAheadController,
                      decoration: InputDecoration(
                          hintText: "Tên",
                          hintStyle: TextStyle(fontSize: 16, fontFamily: 'Tahoma'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey,
                          contentPadding: EdgeInsets.all(20),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 24, right: 16),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 28,
                            ),
                          )
                      )
                  ),

                  suggestionsCallback: (pattern){
                    return _getSuggestions(snapshot.data as List<ProvinceModel>, pattern);
                  },
                  itemBuilder: (context, suggestion){
                    // debugPrint(suggestion.toString());
                    return ListTile(
                      title: Text(suggestion.toString()),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller){
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (suggestion){
                    this._typeAheadController.text = suggestion.toString();
                    // String a = snapshot.data.firstWhere((element) => element. == suggestion).slug);
                    // List<ProvinceModel> a = (snapshot.data as List<ProvinceModel>).firs;
                    setState(() {
                        proSummary = covidService.getProvinceData((snapshot.data as List<ProvinceModel>).firstWhere((element) => element.fullname == suggestion).keyword);
                      
                    });
                  },
                ),

                SizedBox(
                  height: 8,
                ),

                FutureBuilder(
                  future: proSummary,
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
                            // : Center(child: Text("Data is here"),);
                            : VietnamStatistics(
                          summary: snapshot.data as CovidSummaryModel,
                        );
                    }
                  },
                ),

              ],
            );
        }
      },

    );
  }
}

