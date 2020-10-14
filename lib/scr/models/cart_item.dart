import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  static const NAME = "name";
  static const ID = "id";
  static const IMAGE = "image";
  static const PRODUCT_ID = "productId";
  static const QUANTITY = "quantity";
  static const PRICE = "price";

  String _id;
  String _name;
  String _image;
  String _productId;
  int _quantity;
  int _price;

  //getters

  String get id => _id;

  String get name => _name;

  String get image => _image;

  String get productId => _productId;

  int get quantity => _quantity;

  int get price => _price;


  CartItemModel.fromMap(Map data) {
    _id = data[ID];
    _name = data[NAME];
    _image = data[IMAGE];
    _productId = data[PRODUCT_ID];
    _quantity = data[QUANTITY];
    _price = data[PRICE];
  }

  Map toMap() => {
    ID: _id,
    IMAGE: _image,
    NAME: _name,
    PRODUCT_ID: _productId,
    QUANTITY: _quantity,
    PRICE: _price

  };
}