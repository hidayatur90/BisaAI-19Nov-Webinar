import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialize();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const ReusableWidgetView(),
    ),
  );
}
