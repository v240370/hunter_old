import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const RATING = "rating";
  static const PRICE = "price";
  static const NETTO = "netto";
  static const RESTAURANT = "restaurant";
  static const RESTAURANT_ID = "restaurantId";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const RATES = "rates";
  static const FEATURED = "featured";

  int _id;
  String _name;
  String _image;
  double _rating;
  int _price;
  int _netto;
  String _restaurant;
  int _restaurantId;
  String _description;
  String _category;
  int _rates;
  bool _featured;

  //getters

  int get id => _id;

  String get name => _name;

  String get image => _image;

  double get rating => _rating;

  int get price => _price;

  int get netto => _netto;

  bool get featured => _featured;

  int get rates => _rates;

  String get restaurant => _restaurant;

  int get restaurantId => _restaurantId;

  String get description => _description;

  String get category => _category;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _netto = snapshot.data[NETTO];
    _rates = snapshot.data[RATES];
    _rating = snapshot.data[RATING];
    _restaurant = snapshot.data[RESTAURANT];
    _restaurantId = snapshot.data[RESTAURANT_ID];
    _description = snapshot.data[DESCRIPTION];
    _category = snapshot.data[CATEGORY];
    _featured = snapshot.data[FEATURED];
  }
}
