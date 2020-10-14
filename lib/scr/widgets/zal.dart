import 'package:flutter/material.dart';
import 'package:hunter/scr/helpers/style.dart';
import 'package:hunter/scr/models/restaurant.dart';
import 'package:hunter/scr/widgets/loading.dart';
import 'package:hunter/scr/widgets/small_floating_button.dart';
import 'package:transparent_image/transparent_image.dart';


class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantWidget({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.all(2),
        child: Stack(
          children: <Widget>[
            Container(
              child: Padding(padding: EdgeInsets.all(0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 120,
                                child: Loading()),
                          ),
                        ),
                        Center(
                          child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: restaurant.image),
                        )
                      ],
                    )),
              ),
            ),

//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                SmallButton(Icons.favorite),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                    width: 50,
//                    decoration: BoxDecoration(
//                        color: white,
//                        borderRadius: BorderRadius.circular(5)
//                    ),
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                            padding: const EdgeInsets.all(2.0),
//                            child: Icon(
//                              Icons.star, color: Colors.yellow[900],
//                              size: 20,)
//                        ),
//                        Text(restaurant.rating.toString())
//                      ],
//                    ),
//
//                  ),
//                ),
//              ],
//            ),
//          ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius
                        .circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.025),
                      ],
                    ),

                  ),
                ),
              ),
            ),

            Positioned.fill(child: Align(

              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 9, 6, 8),
                    child: RichText(text: TextSpan(children: [
                      TextSpan(text: "${restaurant.name} \n",
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: white)),
//                    TextSpan(text: "by:  ",
//                        style: TextStyle(fontSize: 16,
//                            fontWeight: FontWeight.w300,
//                            color: white)),
                      TextSpan(text: "ул. 22-я линия, 40",
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    ], style: TextStyle(color: black))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: RichText(text: TextSpan(children: [
                      TextSpan(text: "8-988-988-77-70",
                          style: TextStyle(fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: white)),
                    ], style: TextStyle(color: black))),
                  ),

                ],
              ),
            ))
          ],
        )
    );
  }
}
