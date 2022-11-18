import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LayoutBuilder(
            builder: (context, constraint) {
              List menus = [
                {
                  "icon": Icons.list,
                  "label": "Home",
                  "onTap": () {
                    controller.navList();
                  },
                },
                {
                  "icon": Icons.add,
                  "label": "Add New Product",
                  "onTap": () {
                    controller.navAdd();
                  },
                },
                {
                  "icon": Icons.logout,
                  "label": "Logout",
                  "onTap": () {
                    controller.isLogout();
                  },
                },
              ];

              return Wrap(
                children: List.generate(
                  menus.length,
                  (index) {
                    var item = menus[index];

                    var size = constraint.biggest.width / 3;

                    return SizedBox(
                      width: size,
                      height: size,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blueGrey,
                          animationDuration: const Duration(milliseconds: 1000),
                          backgroundColor: Colors.transparent,
                          splashFactory: InkSplash.splashFactory,
                          shadowColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                        onPressed: () => item["onTap"](),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item["icon"],
                              color: Colors.blueGrey,
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "${item["label"]}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 8.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();

  void setState(Null Function() param0) {}
}
