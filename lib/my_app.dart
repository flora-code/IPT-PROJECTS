import 'package:auntie_rafiki/pages/auth/login_page.dart';
import 'package:auntie_rafiki/pages/boom_color_changer_page.dart';
import 'package:auntie_rafiki/pages/event_list_page.dart';
import 'package:auntie_rafiki/providers/auth_provider.dart';
import 'package:auntie_rafiki/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PT1',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: LoginPage(),
        routes: {
          'boom_color_changer_page': (context) {
            return BoomColorChangerPage();
          },
          'home_page': (context) {
            return HomePage();
          },
          'event_list_page': (context) {
            return EventListPage();
          }
        },
      ),
    );
  }
}
