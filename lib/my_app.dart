import 'package:auntie_rafiki/pages/auth/login_page.dart';
import 'package:auntie_rafiki/pages/boom_color_changer_page.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PT1',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginPage(),
      routes: {
        'boom_color_changer': (context) {
          return BoomColorChangerPage();
        },
        'home_page': (context) {
          return HomePage();
        }
      },
    );
  }
}
