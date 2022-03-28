import 'package:widepixelimage/utils/constant/ApiConstant.dart';

/// query : "Test"
/// page : 1
/// per_page : 10
/// order_by : "latest"
/// color : "orange"
/// orientation : "portrait"

class SearchPicReq {
  String? query;
  int? page;
  int? perPage ;
  String? orderBy;
  String? color;
  String? orientation;

  SearchPicReq({
      this.query, 
      this.page, 
      this.perPage= ApiConstant.PAGE_SIZE,
      this.orderBy, 
      this.color, 
      this.orientation});

  SearchPicReq.fromJson(Map<String, dynamic> json) {
    query = json["query"];
    page = json["page"];
    perPage = json["per_page"];
    orderBy = json["order_by"];
    color = json["color"];
    orientation = json["orientation"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["query"] = query;
    map["page"] = page;
    map["per_page"] = perPage;
    map["order_by"] = orderBy;
    map["color"] = color;
    map["orientation"] = orientation;
    return map;
  }

}