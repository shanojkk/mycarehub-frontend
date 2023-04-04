import 'package:flutter/material.dart';

class MessageOptionItem extends StatelessWidget {
  const MessageOptionItem({
    required this.title,
    required this.onTap,
    this.contentColor,
    this.iconData,
    this.buttonKey,
  });

  final Key? buttonKey;

  final String title;
  final Function() onTap;
  final Color? contentColor;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: buttonKey,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Visibility(
              visible: iconData != null,
              child: Icon(iconData, size: 32, color: contentColor),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: contentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
