import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ncovidapp/models/province.dart';
import 'package:ncovidapp/models/covid_summary.dart';

class CovidService{
  Future<List<ProvinceModel>> getProvinces() async{
    final data = await http.Client().get("http://192.168.1.115:8080/api/provinces");

    debugPrint("b");
    if(data.statusCode != 200)
        throw Exception();

    List<ProvinceModel> provinces = (json.decode(utf8.decode(data.bodyBytes)) as List).map((e) => new ProvinceModel.fromJson(e)).toList();
    // List<ProvinceModel> provinces = (json.decode((data.body)) as List).map((item) => new ProvinceModel.fromJson(item)).toList();
    // List<ProvinceModel> provinces = (json.decode(data.body) as List).map((e) => new ProvinceModel.fromJson(e)).toList();
    debugPrint(provinces.first.fullname);
    return provinces;
  }

  Future<CovidSummaryModel> getSummaryData() async{
    final data = await http.Client().get("http://192.168.1.115:8080/api/ncovid");


    if(data.statusCode != 200)
      throw Exception();

    // String s = Utf8Decoder().convert(data.bodyBytes);
    CovidSummaryModel summary = new CovidSummaryModel.fromJson(json.decode(utf8.decode(data.bodyBytes)));
    debugPrint(summary.area);
    return summary;
  }

  Future<CovidSummaryModel> getProvinceData(String keyword) async{
    final data = await http.Client().get("http://192.168.1.115:8080/api/ncovid/"+keyword);

    if(data.statusCode != 200)
      throw Exception();

    CovidSummaryModel summary = new CovidSummaryModel.fromJson(json.decode(utf8.decode(data.bodyBytes)));
    debugPrint(summary.area+" -"+summary.cases.toString());
    return summary;
  }

}