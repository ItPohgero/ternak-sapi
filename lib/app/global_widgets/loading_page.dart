import 'package:flutter/material.dart';

Widget loadingPage(String title) => Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
