class CovidSummaryModel{
  final String area;
  final int cases;
  final int healthCare;
  final int recovered;
  final int deaths;

  CovidSummaryModel(
      this.area, this.cases, this.healthCare, this.recovered, this.deaths);

  factory CovidSummaryModel.fromJson(Map<String, dynamic> json){
    return CovidSummaryModel(
      json["area"],
      json["cases"],
      json["healthCare"],
      json["recovered"],
      json["deaths"],
    );
  }
}