import 'package:flutter/material.dart';


class ZalScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Нижний Банкетный зал"),
            centerTitle: true,
            backgroundColor: Colors.red,

          ),

          body: GridView.count(

                  crossAxisCount: 2,
                  childAspectRatio: (250 / 165),
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                children: <Widget>[
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0610-scaled.jpg?alt=media&token=90d05da8-c687-42ca-9e26-de6cfc1deca3"),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0606-scaled.jpg?alt=media&token=9d8fc291-8302-47a6-834f-244f8f7fbfed"),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0585-scaled.jpg?alt=media&token=f5410b90-6cca-4e12-bf9e-c183b1b11c02"),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0582-scaled.jpg?alt=media&token=8d86ec22-3a56-4645-bfc7-529b2c64fbd1"),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0563-scaled.jpg?alt=media&token=ccabc738-c053-40da-b27e-1923464758f8"),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0558-scaled.jpg?alt=media&token=f25d60b8-68aa-4781-81ac-94c97fd9f5eb"),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0531-scaled.jpg?alt=media&token=ed57a914-4b11-4968-bcdf-b444e5598485"),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0615-scaled.jpg?alt=media&token=5ed24a84-7948-45ed-ae7e-16bd4ff6e93d"),
                ],
              ),

          ),
      );
    }
  }

