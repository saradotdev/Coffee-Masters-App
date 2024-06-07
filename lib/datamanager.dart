import 'datamodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for jsonDecode()

class DataManager {
  List<Category>? _menu; // we will receive this data from the network (http), so it might be null at first
  List<ItemInCart> cart = [];

  fetchMenu() async {
    const url = 'https://firtman.github.io/coffeemasters/api/menu.json';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = response.body;
      var decodedData = jsonDecode(body) as List<dynamic>;
      _menu = [];
      for (var json in decodedData) {
        _menu?.add(Category.fromJson(json));
      }
    }
  }
  
  // an async function promising to return a list of categories in future
  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu(); 
    }
    return _menu!;
  }

  void addProduct(Product currentProduct) {
    // adding the product in cart, but cart is of type ItemInCart which takes quantity of product as well
    bool found = false; // first we check if item is already in cart. if yes, we increase its quantity
    for (var item in cart) {
      if (item.product.id == currentProduct.id) {
        item.quantity++;
        found = true;
        break;
      }
    }
    if (found == false) {
      cart.add(ItemInCart(product: currentProduct, quantity: 1)); // using constructor
    }
  }

  void removeProduct(Product currentProduct) {
    cart.removeWhere((item) => item.product.id == currentProduct.id);
  }

  void clearCart() {
    cart.clear();
  }

  double cartTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}