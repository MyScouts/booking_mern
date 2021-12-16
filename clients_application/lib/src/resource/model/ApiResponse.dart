import 'package:flutter_app/src/resource/model/login_model.dart';
import 'package:flutter_app/src/resource/model/serializable.dart';

class ApiResponse<T extends Serialzeliable> {
  int? status;
  String? message;
  bool? success;
  T? data;

  ApiResponse({this.status, this.message, this.success, this.data});

  factory ApiResponse.fromJson(
      Map<String, dynamic> jsonData, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      status: jsonData['status'],
      message: jsonData['message'],
      data: create(jsonData['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": this.status,
        "message": this.message,
        "data": this.data?.toJson(),
      };
}
