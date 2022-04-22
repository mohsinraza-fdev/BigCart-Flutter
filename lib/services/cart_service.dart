import 'package:big_cart/models/product_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartService {
  List<Product> _cart = <Product>[];
  List<Product> get cart => _cart;

  List<Product> _favorites = <Product>[];
  List<Product> get favorites => _favorites;

  void addProduct(Product product) {
    int index = _cart.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      product.qty = 1;
      _cart.add(product);
    } else {
      _cart[index].qty = (_cart[index].qty ?? 0) + 1;
    }
  }

  void removeProduct(Product product) {
    int index = _cart.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      if (_cart[index].qty == 1) {
        deleteProduct(_cart[index]);
      } else {
        _cart[index].qty = (_cart[index].qty ?? 2) - 1;
      }
    }
  }

  void deleteProduct(Product product) {
    int index = _cart.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      _cart.removeAt(index);
    }
  }

  void clearCart() {
    _cart = <Product>[];
  }

  int getQuantityFromProduct(Product product) {
    int index = _cart.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      return _cart[index].qty!;
    } else {
      return 0;
    }
  }

  void addOrRemoveFavorites(Product product) {
    int index = _favorites.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      _favorites.add(product);
    } else {
      _favorites.removeAt(index);
    }
  }
}
