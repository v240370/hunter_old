import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hunter/scr/models/order.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/yandex.dart';


class OrderServices{
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  Future<void> createOrder({String userId, String userName, String userPhone, String id, String description, String status , List cart, int totalPrice}) async {
    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "userName": userName,
      "userPhone": userPhone,
      "id": id,
      "cart": cart,
      "total": totalPrice,
      "createdAt": DateTime
          .now()
          .millisecondsSinceEpoch,
      "description": description,
      "status": status
    });
  }

  Future<void> sendOrder({String userId, String userName, String userPhone, String id, List cart, int totalPrice}) async {
    String username = 'desmailer@yandex.ru';
    String password = 'designvolga2020';

    final Map<String, String> where = {
      'userId': 'userId',
      'userName': 'userName',
      'userPhone': 'userPhone',
      'id': 'id',
      'cart': 'cart',
      'total': 'totalPrice',
    };


    final smtpServer = yandex(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add('hunter.dostavka@mail.ru') //recipent email
      ..ccRecipients.addAll(['hunter.dostavka@yandex.ru']) //cc Recipents emails
      ..bccRecipients.add(Address('v240370@yandex.ru')) //bcc Recipents emails
      ..subject = 'Hunter Delivery. Новый заказ из приложения :: 😀 :: ${DateTime.now()}' //subject of the email
      ..text = "${userId}\n ${userName}\n ${userPhone}\n ${id}\n ${cart}\n ${totalPrice}";//body of the email

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n'+ e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }

  }





  Future<List<OrderModel>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });

}


