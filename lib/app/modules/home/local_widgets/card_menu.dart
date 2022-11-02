import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

CardMenu(
    {@required Color color,
    @required String image,
    @required String title,
    @required String page}) {
  return Card(
    color: color,
    child: InkWell(
      onTap: () => Get.toNamed(page),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/${image}"),
            height: 120,
            width: 120,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  );
}
