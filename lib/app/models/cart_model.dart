import 'package:ngamar/app/models/product_model.dart';

class CartModel {
  ProductModel product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
  });
}
