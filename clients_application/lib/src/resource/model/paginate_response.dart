import 'dart:developer';

import 'package:flutter_app/src/resource/model/serializable.dart';

class PaginateResponse<T extends Serialzeliable> extends Serialzeliable {
  int? totalPage;
  int? page;
  int? pageSize;
  List<T> items;

  PaginateResponse(
      {this.totalPage, this.page, this.pageSize, required this.items});

  factory PaginateResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    final items = json['items'].cast<Map<String, dynamic>>();
    return PaginateResponse(
        items: new List<T>.from(
            items.map((itemsJson) => fromJsonModel(itemsJson))),
        page: json['page'],
        pageSize: json['pageSize'],
        totalPage: json['totalPage']);
  }

  @override
  Map<String, dynamic> toJson() => {
        "totalPgae": this.totalPage,
        "page": this.page,
        "pageSize": this.pageSize,
        "items": this.items,
      };
}
