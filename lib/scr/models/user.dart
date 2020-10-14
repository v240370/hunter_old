import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hunter/scr/models/cart_item.dart';


class UserModel{
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";



  String _name;
  String _email;
  String _phone;
  String _id;
  String _stripeId;
  int _priceSum = 0;
  int _quantitySum = 0;


//  getters
  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get id => _id;
  String get stripeId => _stripeId;

//  public variable
  List cart;
  int totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _phone = snapshot.data[PHONE];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID];
    cart = snapshot.data[CART] ?? [];
    totalCartPrice = snapshot.data[CART] == null ? 0 :getTotalPrice(cart: snapshot.data[CART]);
  }

  int getTotalPrice({List cart}){
    if(cart == null){
      return 0;
    }
    for(Map cartItem in cart){
      _priceSum += cartItem["price"] * cartItem["quantity"];
    }

    int total = _priceSum;

    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");

    return total;
  }

// List<CartItemModel> _convertCartItems(List<Map> cart){
//    List<CartItemModel> convertedCart = [];
//    for(Map cartItem in cart){
//      convertedCart.add(CartItemModel.fromMap(cartItem));
//    }
//    return convertedCart;
//  }
}