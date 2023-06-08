import 'package:get/get.dart';
import 'package:ngamar/app/models/cart_model.dart';
import 'package:ngamar/app/models/product_model.dart';
import 'package:ngamar/app/modules/widgets/dialogs/custom_toast.dart';

class CartController extends GetxController {
  final cartItems = <CartModel>[].obs;

  void addToCart(ProductModel product, int quantity) {
    final existingItem =
        cartItems.firstWhereOrNull((item) => item.product.id == product.id);

    if (existingItem != null) {
      existingItem.quantity += quantity;
      showToast('Product already added');
    } else {
      cartItems.add(
        CartModel(
          product: product,
          quantity: quantity,
        ),
      );
      showToast('Added to Cart');
    }
  }

  void removeFromCart(ProductModel product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    showToast('Remove from Cart');
  }

  double getSubtotal() {
    var subtotal = 0.0;
    for (final item in cartItems) {
      subtotal += item.product.currentPrice * item.quantity;
    }
    return subtotal;
  }

  void clearCart() {
    cartItems.clear();
  }
}
