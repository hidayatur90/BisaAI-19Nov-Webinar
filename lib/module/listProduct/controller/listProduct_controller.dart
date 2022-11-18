import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/listProduct_view.dart';

class ListProductController extends State<ListProductView>
    implements MvcController {
  static late ListProductController instance;
  late ListProductView view;

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
