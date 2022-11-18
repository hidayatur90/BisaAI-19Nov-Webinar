import 'package:fhe_template/database/db_product.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../../../model/Product.dart';
import '../view/addProduct_view.dart';

class AddProductController extends State<AddProductView>
    implements MvcController {
  static late AddProductController instance;
  late AddProductView view;

  final Product? product;
  DbProduct db = DbProduct();

  TextEditingController? name;
  TextEditingController? price;
  TextEditingController? description;

  AddProductController({this.product});

  @override
  void initState() {
    name = TextEditingController(
        text: widget.product == null ? '' : widget.product!.name);

    price = TextEditingController(
        text: widget.product == null ? '' : widget.product!.price);

    description = TextEditingController(
        text: widget.product == null ? '' : widget.product!.description);

    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> upsertProduct() async {
    if (widget.product != null) {
      //update
      await db.updateProduct(Product.fromMap({
        'id': widget.product!.id,
        'name': name!.text,
        'price': int.parse(price!.text),
        'description': description!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveProduct(Product(
        name: name!.text,
        price: int.parse(price!.text),
        description: description!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
