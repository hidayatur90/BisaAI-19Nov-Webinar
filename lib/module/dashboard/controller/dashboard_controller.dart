import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;
  int counter = 1;
  List<Color> myColors = [
    Colors.blue.shade200,
    Colors.amber,
  ];
  Color curentColor = Colors.grey.shade200;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  // updateCardIncrement() {
  //   counter == 10 ? counter = counter : counter++;
  //   setState(() {});
  // }

  // updateCardDecrement() {
  //   counter > 1 ? counter-- : counter = counter;
  //   setState(() {});
  // }

  // updateColor() {
  //   counter % 2 == 0 ? curentColor = myColors[0] : curentColor = myColors[1];
  //   setState(() {});
  // }

  isLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  navList() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListProductView()),
    );
  }

  navAdd() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductView()),
    );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
