import 'package:flutter/material.dart';

class WidgetUserAvatar extends StatelessWidget {
  final String imageUrl;
  const WidgetUserAvatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(50)),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage(imageUrl))),
        ),
      ),
    );
  }
}
