import 'package:flutter/material.dart';

class MessageProvider {
  static showSnackbar(
      {@required BuildContext context,
      @required String message,
      int time = 500}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: time),
    ));
  }
}
