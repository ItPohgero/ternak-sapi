import 'package:flutter/material.dart';

Widget ShapeButton(
        {@required String label,
        @required Function action,
        @required Color color}) =>
    Material(
      color: color,
      borderRadius: BorderRadius.circular(50),
      elevation: 3,
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        onTap: () => action(),
      ),
    );
