import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/services.dart';
import '../controller/addProduct_controller.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key}) : super(key: key);

  get product => null;

  Widget build(context, AddProductController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AddProduct"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300],
              ),
              child: (controller.widget.product == null)
                  ? const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () {
                controller.upsertProduct();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.production_quantity_limits,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "What's your product name?",
                ),
                onChanged: (value) {},
              ),
              TextFormField(
                controller: controller.price,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.price_change,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your price of product',
                ),
                onChanged: (value) {},
              ),
              TextFormField(
                controller: controller.description,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Describe your product",
                ),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AddProductView> createState() => AddProductController();
}
