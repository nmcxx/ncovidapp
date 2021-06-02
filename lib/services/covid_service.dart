import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ncovidapp/models/province.dart';
import 'package:ncovidapp/models/covid_summary.dart';

class CovidService{
  Future<List<ProvinceModel>> getProvinces() async{
    final data = await http.Client().get("http://10.0.3.2:8080/api/provinces");

    if(data.statusCode != 200)
        throw Exception();

    List<ProvinceModel> provinces = (json.decode(data.body));
    return provinces;
  }

  Future<CovidSummaryModel> getSummaryData() async{
    final data = await http.Client().get("http://10.0.3.2:8080/api/ncovid");

    if(data.statusCode != 200)
      throw Exception();

    CovidSummaryModel summary = new CovidSummaryModel.fromJson(json.decode(data.body));
    return summary;
  }

  Future<CovidSummaryModel> getProvinceData(String keyword) async{
    final data = await http.Client().get("http://10.0.3.2:8080/api/ncovid/"+keyword);

    if(data.statusCode != 200)
      throw Exception();

    CovidSummaryModel summary = new CovidSummaryModel.fromJson(json.decode(data.body));
    return summary;
  }

}