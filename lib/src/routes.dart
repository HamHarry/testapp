import 'package:flutter/material.dart';
import 'package:testapp/src/app.dart';
import 'package:testapp/src/pages/setting/setting.dart';

class AppRoute {
  static const app = "app";
  static const setting = "setting";

  static get all => <String, WidgetBuilder>{
        app: (context) => const App(),
        setting: (context) => const Settingpage(),
      };
}
