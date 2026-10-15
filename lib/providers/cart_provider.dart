import 'package:flutter/foundation.dart';
import '../models/book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  List<CartItem> get items => _items.values.toList();

  int get totalItems =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  int get totalPrice => _items.values
      .fold(0, (sum, item) => sum + item.book.price * item.quantity);

  bool get isEmpty => _items.isEmpty;

  void addItem(Book book) {
    if (_items.containsKey(book.id)) {
      _items[book.id]!.quantity++;
    } else {
      _items[book.id] = CartItem(book: book);
    }
    notifyListeners();
  }

  void removeItem(Book book) {
    if (!_items.containsKey(book.id)) return;

    if (_items[book.id]!.quantity > 1) {
      _items[book.id]!.quantity--;
    } else {
      _items.remove(book.id);
    }
    notifyListeners();
  }
  
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}