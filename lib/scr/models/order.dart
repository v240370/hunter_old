import 'package:cloud_firestore/cloud_firestore.dart';


class OrderModel{
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const USER_NAME = "userName";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _description;
  String _userId;
  String _userName;
  String _email;
  String _phone;
  String _status;
  int _createdAt;
  int _total;

//  getters
  String get id => _id;
  String get description => _description;
  String get userId => _userId;
  String get userName => _userName;
  String get email => _email;
  String get phone => _phone;
  String get status => _status;
  int get total => _total;
  int get createdAt => _createdAt;

  // public variable
  List cart;


  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _description = snapshot.data[DESCRIPTION];
    _total = snapshot.data[TOTAL];
    _status = snapshot.data[STATUS];
    _userId = snapshot.data[USER_ID];
    _userName = snapshot.data[USER_NAME];
    _email = snapshot.data[EMAIL];
    _phone = snapshot.data[PHONE];
    _createdAt = snapshot.data[CREATED_AT];
    cart = snapshot.data[CART];
  }

}
