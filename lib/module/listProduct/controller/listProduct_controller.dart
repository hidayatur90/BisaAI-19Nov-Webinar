import 'package:fhe_template/core.dart';
import 'package:fhe_template/database/db_product.dart';
import 'package:fhe_template/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/listProduct_view.dart';

class ListProductController extends State<ListProductView>
    implements MvcController {
  static late ListProductController instance;
  late ListProductView view;

  List<Product> listProduct = [];
  DbProduct db = DbProduct();

  @override
  void initState() {
    instance = this;
    _getAllProduct();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> _getAllProduct() async {
    //list menampung data dari database
    var list = await db.getAllProduct();

    //ada perubahanan state
    setState(() {
      //hapus data pada listKontak
      listProduct.clear();

      //lakukan perulangan pada variabel list
      for (var product in list!) {
        //masukan data ke listProduct
        listProduct.add(Product.fromMap(product));
      }
    });
  }

  //menghapus data Kontak
  Future<void> _deleteProduct(Product product, int position) async {
    await db.deleteProduct(product.id!);
    setState(() {
      listProduct.removeAt(position);
    });
  }

  toAddProduct() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductView()),
    );
  }
}
