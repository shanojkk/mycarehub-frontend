import 'package:flutter/material.dart';

class UpdateMessageWidget extends StatelessWidget {
  const UpdateMessageWidget({super.key, required this.msg, this.icon});

  final String msg;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).primaryColor.withOpacity(0.05),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            if (icon != null) ...<Widget>[
              Icon(icon, color: Colors.black26),
              const SizedBox(width: 5),
            ],
            Expanded(
              child: Text(
                msg,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  height: 1.5,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
