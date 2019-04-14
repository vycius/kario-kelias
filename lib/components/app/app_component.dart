import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kario_kelias/api/api_service.dart';
import 'package:kario_kelias/components/login/user_login_component.dart';
import 'package:kario_kelias/components/quiz/quiz_component.dart';
import 'package:kario_kelias/components/results/results_component.dart';
import 'package:kario_kelias/localization/firebase_localization.dart';

class AppComponent extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kario kelias',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
//      home: MyHomePage(title: 'Kario kelias'),
      home: UserLoginFullscreenComponent(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FirebaseLocalization.delegate,
      ],
      supportedLocales: [
        const Locale('lt', 'LT'),
        const Locale('en', 'US'),
      ],
    );
  }
}

