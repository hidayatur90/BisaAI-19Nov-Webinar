import 'package:fhe_template/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import '../controller/listProduct_controller.dart';

class ListProductView extends StatefulWidget {
  const ListProductView({Key? key}) : super(key: key);

  Widget build(context, ListProductController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ListProduct"),
        actions: const [],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.listProduct.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Product product = controller.listProduct[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      color: Colors.blue[400],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                12.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            "PROMO",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${product.name}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "8.1 km",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            const Icon(
                              Icons.circle,
                              size: 4.0,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange[400],
                              size: 16.0,
                            ),
                            const Text(
                              "4.8",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          '${product.description}',
                          style: const TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          '${product.price}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.toAddProduct();
        },
      ),
    );
  }

  @override
  State<ListProductView> createState() => ListProductController();
}
