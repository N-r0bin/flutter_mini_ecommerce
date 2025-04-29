import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'Mini Store',
      home: HomeScreen(),
    );
  }
}
