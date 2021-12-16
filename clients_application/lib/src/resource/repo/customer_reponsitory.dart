import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/resource/model/ApiResponse.dart';
import 'package:flutter_app/src/resource/model/customer_model.dart';
import 'package:flutter_app/src/resource/model/paginate_response.dart';
import 'package:flutter_app/src/utils/utils.dart';

class CustomerResponsitory {
  CustomerResponsitory._();

  static CustomerResponsitory? _instance;

  factory CustomerResponsitory() {
    if (_instance == null) _instance = CustomerResponsitory._();
    return _instance!;
  }

  //
  // <ApiResponse<PaginateResponse<CustomerModel>>>
  Future<PaginateResponse<CustomerModel>> getCustomers(
      {page = 1, pageSize = 10}) async {
    String url = "customers";
    try {
      Response response = await AppClients()
          .get(url, queryParameters: {"page": page, "pageSize": pageSize});
      PaginateResponse<CustomerModel> restult =
          PaginateResponse<CustomerModel>.fromJson(
              response.data['data'], CustomerModel.fromJsonModel);
      return restult;
    } catch (e) {
      return PaginateResponse<CustomerModel>(items: []);
    }
  }
}
