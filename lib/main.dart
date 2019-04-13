import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kario_kelias/components/app/app_component.dart';

Future<Null> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    FlutterError.dumpErrorToConsole(details);
  };

  runZoned<Future<Null>>(() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(new AppComponent());
  }, onError: (error, stackTrace) async {
    print(error);
  });
}
