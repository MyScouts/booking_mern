import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/widgets/widget_user_avatar.dart';

class WidgetActivityUser extends StatelessWidget {
  final String userName;
  final String imageUrl;

  const WidgetActivityUser(
      {Key? key, required this.imageUrl, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          WidgetUserAvatar(imageUrl: imageUrl),
          SizedBox(height: 5),
          Text(
            userName,
            textAlign: TextAlign.center,
            style: STYLE_SMALL_BOLD,
            softWrap: true,
          )
        ],
      ),
    );
  }
}
