class ProvinceModel{
  final String keyword;
  final String fullname;

  ProvinceModel(this.keyword, this.fullname);

  factory ProvinceModel.fromJson(Map<String, dynamic> json){
    return ProvinceModel(
      json["keyWord"],
      json["fullName"],
    );
  }

}