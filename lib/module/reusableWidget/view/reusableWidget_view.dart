import 'package:fhe_template/module/reusableWidget/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import '../controller/reusableWidget_controller.dart';

class ReusableWidgetView extends StatefulWidget {
  const ReusableWidgetView({Key? key}) : super(key: key);

  Widget build(context, ReusableWidgetController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ReusableWidget"),
        actions: const [],
      ),
      body: Column(
        children: const [
          TextFieldJoko(
            label: "Name",
          ),
          TextFieldJoko(
            label: "Addres",
          ),
          TextFieldJoko(
            label: "NIK",
          ),
        ],
      ),
    );
  }

  @override
  State<ReusableWidgetView> createState() => ReusableWidgetController();
}
