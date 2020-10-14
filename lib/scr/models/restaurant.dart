import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const NAME = "name";
  static const ID = "id";
  static const AVG_PRICE = "avgPrice";
  static const RATES = "rates";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const POPULAR = "popular";

  int _id;
  String _name;
  String _image;
  double _avgPrice;
  double _rating;
  bool _popular;
  int _rates;

  //getters

  int get id => _id;

  String get name => _name;

  String get image => _image;

  double get rating => _rating;

  double get avgPrice => _avgPrice;

  bool get popular => _popular;

  int get rates => _rates;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _avgPrice = snapshot.data[AVG_PRICE];
    _rates = snapshot.data[RATES];
    _rating = snapshot.data[RATING];
    _popular = snapshot.data[POPULAR];
  }
}
