import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/model/ActivityModel.dart';
import 'package:flutter_app/src/resource/model/MessageModel.dart';
import 'package:get/get.dart';

class ChatListViewModel extends BaseViewModel {
  String? chatId;
  List<ActivityModel>? activities;
  List<MessageModel>? messages;

  initial() async {
    chatId = Get.arguments;
    activities = fakeActivityData();
    messages = fakeListMessages();
  }
}
