import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/model/customer_model.dart';
import 'package:flutter_app/src/resource/model/paginate_response.dart';
import 'package:flutter_app/src/resource/repo/customer_reponsitory.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel {
  late CustomerResponsitory customerResponsitory;
  late PaginateResponse<CustomerModel> response;
  final customer = BehaviorSubject<List<CustomerModel>>();
  bool onloading = false;
  bool loadMore = false;
  initial() async {
    customerResponsitory = new CustomerResponsitory();
    await getCustomerData();
  }

  getCustomerData({page = 1, pageSize = 10}) async {
    onloading = true;
    response =
        await customerResponsitory.getCustomers(page: page, pageSize: pageSize);
    if (response.totalPage != null) {
      customer.add(response.items);
    }
    onloading = false;
    notifyListeners();
  }

  onLoadMore() async {
    loadMore = true;
    await getCustomerData(page: 2, pageSize: 10);
    loadMore = false;
    notifyListeners();
  }
}
