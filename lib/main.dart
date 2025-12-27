import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // or any color you want
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // dark icons on light bg
    ),
  );

  runApp(const MyApp());
}
