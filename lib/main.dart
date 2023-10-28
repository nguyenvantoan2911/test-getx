import 'package:app_lo/home/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
    path: 'asset/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}
