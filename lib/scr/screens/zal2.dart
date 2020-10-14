import 'package:flutter/material.dart';


class Zal2Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Верхний Банкетный зал"),
          centerTitle: true,
          backgroundColor: Colors.red,

        ),

        body: GridView.count(

          crossAxisCount: 2,
          childAspectRatio: (250 / 165),
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          children: <Widget>[
            Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal2%2FIMG_5611-scaled.jpg?alt=media&token=e881e6b9-fe04-41a6-a5b3-8ca9b01ab8a1"),
            Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal2%2FIMG_5608-scaled.jpg?alt=media&token=42a8ad6f-1703-448e-a3a9-5387c5cda2e3"),
            Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal2%2FIMG_5639-scaled.jpg?alt=media&token=b18c9637-e6bf-49c5-82c3-2bb71d601345"),
            Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal2%2FIMG_5658-scaled.jpg?alt=media&token=aca79bad-d0ae-4192-a793-3b6d14d71794"),
            Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal2%2FIMG_5642-scaled.jpg?alt=media&token=a6703f45-cfef-4212-87ad-217fcc43b02e"),
            Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal2%2FIMG_5665-scaled.jpg?alt=media&token=f8aececa-1660-457e-b144-a48fde265a20"),
           ],
        ),

      ),
    );
  }
}

