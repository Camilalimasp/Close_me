import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';

void main() async {
  //await Firebase.initializeApp();

  //runApp(AppWidget());

  runApp(const MaterialApp(
    title: 'Close.me',
    home: AppWidget(),
  ));
}
