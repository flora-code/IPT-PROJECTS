import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;

  const RoundButton({Key? key, required this.onTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          height: 110,
          width: 110,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipOval(
              child: Container(
                height: 110,
                width: 110,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
