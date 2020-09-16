import 'package:flutter/material.dart';

class InteractButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onPressed;

  const InteractButton({
    Key key,
    this.text,
    this.iconData,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          children: [
            Icon(iconData),
            SizedBox(width: 12),
            Text(
              text,
              style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 27, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}