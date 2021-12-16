import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/chat_detail/chat_detail_viewmodel.dart';
import 'package:flutter_app/src/presentation/chat_detail/includes/list_message/list_chat.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ChatDetailViewModel>(
        viewModel: ChatDetailViewModel(),
        onViewModelReady: (viewModel) => viewModel!..initial(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 10,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.green.shade800,
              title: Row(children: [
                BackButton(
                  color: Colors.white,
                ),
                CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user1.jpg')),
                SizedBox(width: 15 * 0.75),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kristin",
                      style: STYLE_SMALL_BOLD.copyWith(
                          color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "Active 3m ago",
                      style: STYLE_SMALL_BOLD.copyWith(color: Colors.white),
                    ),
                  ],
                )
              ]),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.local_phone, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.videocam, color: Colors.white),
                ),
                SizedBox(width: 15 * 0.75)
              ],
            ),
            body: _chatBody(),
          );
        });
  }

  _chatBody() {
    return Container(
      child: Column(
        children: [
          ListMessageChat(),
          _chatInputField(),
        ],
      ),
    );
  }

  _chatInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Colors.grey.withOpacity(.5))
        ],
        color: Colors.white,
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icon(Icons.mic, color: Colors.green.shade800),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15 * 0.75),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    Icon(Icons.sentiment_satisfied_alt_outlined),
                    SizedBox(width: 15 / 4),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type message", border: InputBorder.none),
                    )),
                    Icon(Icons.attach_file),
                    Icon(Icons.camera_alt_outlined),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
