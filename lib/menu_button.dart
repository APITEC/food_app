import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final icon;
  final color;
  MenuButton({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: this.color),
            height: 40,
            width: 40,
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Icon(
                icon,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
