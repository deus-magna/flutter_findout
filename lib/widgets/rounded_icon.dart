import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {

  final IconData iconData;

  const RoundedIcon({
    Key key, this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black.withOpacity(0.3)
      ),
      child: IconButton(
        icon: Icon(iconData),
        onPressed: () {},
      ),
    );
  }
}