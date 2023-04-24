import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_login/Provider/home_provider.dart';
import 'package:todo_login/Provider/login_provider.dart';
import 'package:todo_login/View/login_screen.dart';

import 'View/home_screen.dart';
import 'View/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'home': (context) => HomeScreen(),
        'login': (context) => LoginScreen(),
      },
    ),
  ));
}
