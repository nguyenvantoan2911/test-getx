import 'package:app_lo/home/detailed_screen/detailed.dart';
import 'package:app_lo/home/Controller/getx_controller.dart';
import 'package:app_lo/home/home_screen.dart';
import 'package:app_lo/widget/buttom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const MyHome());
  }
}
