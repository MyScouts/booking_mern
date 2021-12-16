import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/widgets/widget_user_avatar.dart';

class WidgetItemMessage extends StatelessWidget {
  final String messageName;
  final String message;
  final String avatarUrl;
  final VoidCallback? onClick;
  const WidgetItemMessage(
      {Key? key,
      required this.messageName,
      required this.avatarUrl,
      required this.message,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            WidgetUserAvatar(imageUrl: avatarUrl),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messageName,
                    style: STYLE_SMALL_BOLD.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(
                    message,
                    style: STYLE_SMALL,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "23 min",
                  style: STYLE_SMALL_BOLD.copyWith(color: Colors.green),
                ),
                SizedBox(height: 5),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green.shade600,
                  child: Text(
                    "1",
                    style: STYLE_SMALL_BOLD,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
