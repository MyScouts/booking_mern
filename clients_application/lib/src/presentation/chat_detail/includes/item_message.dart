import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/chat_detail/includes/text_message.dart';
import 'package:get/get.dart';

class MessageItem extends StatelessWidget {
  final bool isSender;
  const MessageItem({Key? key, required this.isSender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          !isSender
              ? CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user1.jpg'))
              : Container(),
          SizedBox(width: 5),
          SizedBox(
            // width: Get.width / 1.5,
            child: Container(
              constraints: BoxConstraints(maxWidth: Get.width / 1.6),
              padding: EdgeInsets.fromLTRB(
                  isSender ? 10 : 20, 20, isSender ? 20 : 10, 15),
              decoration: BoxDecoration(
                color: isSender ? Colors.green : Colors.green.withOpacity(.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextMessage(
                isSdener: isSender,
              ),
            ),
          )
        ],
      ),
    );
  }
}
