import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/reusableWidget_view.dart';

class ReusableWidgetController extends State<ReusableWidgetView> implements MvcController {
  static late ReusableWidgetController instance;
  late ReusableWidgetView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}