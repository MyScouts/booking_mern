import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/home/home.dart';
import 'package:flutter_app/src/resource/model/customer_model.dart';

class HomeScreen extends StatelessWidget {
  late HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
        onViewModelReady: (viewModel) => _homeViewModel = viewModel!..initial(),
        viewModel: HomeViewModel(),
        builder: (contex, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("home"),
            ),
            body: _buildBody(),
          );
        });
  }

  _buildBody() {
    return Container(
        child: StreamBuilder<List<CustomerModel>>(
      stream: _homeViewModel.customer,
      builder: (conntext, snapshot) {
        if (snapshot.hasData) {
          var customers = snapshot.data;
          return _buildListCustomer(customers!);
        } else {
          return Text("No data");
        }
      },
    ));
  }

  _buildListCustomer(List<CustomerModel> customers) {
    return ListView.builder(
        itemCount: customers.length + 1,
        itemBuilder: (context, index) {
          if (index == customers.length - 1) {
            _homeViewModel.onLoadMore();
          }
          return index < customers.length
              ? Container(
                  height: 150,
                  child: Text(customers[index].customerName.toString()),
                )
              : Expanded(
                  child: SizedBox(
                    width: 10,
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("loading more")
                      ],
                    ),
                  ),
                );
        });
  }
}
