import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class TextMessage extends StatelessWidget {
  final bool isSdener;
  const TextMessage({Key? key, required this.isSdener}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Magna ex laboris fugiat enim ex ad. Incididunt proident ex amet reprehenderit irure ea adipisicing. Magna minim sit minim laborum commodo cupidatat aliqua cillum laboris qui amet dolor.",
        softWrap: true,
        style: STYLE_SMALL_BOLD.copyWith(
            fontWeight: FontWeight.w400,
            color: isSdener ? Colors.white : Colors.black,
            fontSize: 15),
        textAlign: isSdener ? TextAlign.right : TextAlign.left,
      ),
    );
  }
}
