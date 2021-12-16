import 'package:flutter_app/src/resource/model/serializable.dart';

class SerectModel extends Serialzeliable {
  String? data;
  SerectModel({this.data});

  factory SerectModel.fromJson(Map<String, dynamic> json) {
    return SerectModel(data: "");
  }

  @override
  Map<String, dynamic> toJson() => {"data": this.data};
}
