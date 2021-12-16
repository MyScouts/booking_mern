import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/chat_detail/includes/item_message.dart';
import 'package:flutter_app/src/presentation/chat_detail/includes/list_message/list_chat_viewmodel.dart';

class ListMessageChat extends StatelessWidget {
  const ListMessageChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListMessageViewModel _viewModel;
    return BaseWidget<ListMessageViewModel>(
        viewModel: ListMessageViewModel(),
        onViewModelReady: (viewModel) => _viewModel = viewModel!..initial(),
        builder: (context, viewMode, child) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemBuilder: (context, index) => MessageItem(
                  isSender: index % 3 == 0 ? true : false,
                )),
      ),
    );
  }
}
