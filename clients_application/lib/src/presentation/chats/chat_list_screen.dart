import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/chats/chat_list_viewmodel.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/widgets/widget_activity.dart';
import 'package:flutter_app/src/presentation/widgets/widget_item_message.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ChatListScreen extends StatelessWidget {
  ChatListViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ChatListViewModel>(
        viewModel: ChatListViewModel(),
        onViewModelReady: (viewModel) => _viewModel = viewModel!..initial(),
        builder: (context, viewMdodel, child) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleHeader(),
                  _buildSearch(),
                  _buildActivities(),
                  _buildListMessage(),
                  _buildNavigatorBottomBar()
                ],
              ),
            )),
          );
        });
  }

  _buildTitleHeader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Message",
            style: STYLE_MEDIUM_BOLD,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.pencil, color: Colors.green),
          )
        ],
      ),
    );
  }

  _buildSearch() {
    return Container(
      child: TextField(
        style: STYLE_SMALL_BOLD,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade300,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              gapPadding: 4,
              borderRadius: BorderRadius.circular(50),
            ),
            hintText: "Search ...",
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
            labelStyle: STYLE_SMALL_BOLD.copyWith(color: Colors.grey)),
      ),
    );
  }

  _buildActivities() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Activities",
            style: STYLE_SMALL_BOLD,
          ),
          SizedBox(height: 15),
          Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _viewModel!.activities!.length,
                itemBuilder: (context, index) => WidgetActivityUser(
                    imageUrl: _viewModel!.activities![index].imageUrl,
                    userName: _viewModel!.activities![index].userName)),
          )
        ],
      ),
    );
  }

  _buildListMessage() {
    return Expanded(
      flex: 12,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Message",
              style: STYLE_SMALL_BOLD,
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  itemCount: _viewModel!.messages!.length,
                  itemBuilder: (context, index) => WidgetItemMessage(
                      avatarUrl: _viewModel!.messages![index].imageUrl,
                      message: _viewModel!.messages![index].message,
                      messageName: _viewModel!.messages![index].messageName,
                      onClick: () =>
                          Get.toNamed(Routers.chatDetail, arguments: index))),
            )
          ],
        ),
      ),
    );
  }

  _buildNavigatorBottomBar() {
    return Expanded(
        flex: 1,
        child: Container(
          child: Row(
            children: [],
          ),
        ));
  }
}
