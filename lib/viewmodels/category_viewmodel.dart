import 'package:stacked/stacked.dart';
import '../app/api.dart';
import '../app/locator.dart';
import '../models/product_model.dart';
import '../services/authentication_service.dart';
import '../services/cart_service.dart';

class CategoryViewModel extends BaseViewModel {
  final _auth = locator<AuthenticationService>();
  final _cartService = locator<CartService>();

  List<Product> get cart => _cartService.cart;
  List<Product> get favorites => _cartService.favorites;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  List<Product> products = <Product>[];

  int productQuantity(Product product) {
    return _cartService.getQuantityFromProduct(product);
  }

  void addToCart(Product product) {
    _cartService.addProduct(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartService.removeProduct(product);
    notifyListeners();
  }

  void addOrRemoveFavorites(Product product) {
    _cartService.addOrRemoveFavorites(product);
    notifyListeners();
  }

  bool isFavorited(Product product) {
    int index = favorites.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  void onModelReady(int categoryId) async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();
    products = <Product>[];
    try {
      products = await Api.getProductsByCategory(_auth.authToken, categoryId);
      _isLoading = false;
    } catch (e) {
      _hasError = true;
    }
    notifyListeners();
  }
}
