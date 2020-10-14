import 'package:flutter/material.dart';
import 'package:hunter/scr/helpers/screen_navigation.dart';
import 'package:hunter/scr/helpers/style.dart';
import 'package:hunter/scr/models/restaurant.dart';
import 'package:hunter/scr/providers/product.dart';
import 'package:hunter/scr/screens/details.dart';
import 'package:hunter/scr/screens/home.dart';
import 'package:hunter/scr/widgets/custom_text.dart';
import 'package:hunter/scr/widgets/loading.dart';
import 'package:hunter/scr/widgets/product.dart';
import 'package:hunter/scr/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class RestaurantScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantScreen({Key key, this.restaurantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: <Widget>[

              Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      )),

                  // restaurant image
                  ClipRRect(

                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: restaurantModel.image,
                      height: 160,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),

                  // fading black
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        )),
                  ),

                  //restaurant name


                  // average price
   //               Positioned.fill(
     //                 bottom: 40,
      //                child: Align(
       //                   alignment: Alignment.bottomCenter,
        //                  child: CustomText(text: "Average Price: \$" + restaurantModel.avgPrice.toString(), color: white, size: 18, weight: FontWeight.w300,))),

                  // rating widget


                  // close button
                  Positioned.fill(
                      top: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: black.withOpacity(0.2)
                                ),
                                child: Icon(Icons.close, color: white,)),
                          ),
                        ),)),

                  //like button
                  Positioned.fill(
                      top: 5,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: (){
                            },
                            child: SmallButton(Icons.favorite),
                          ),
                        ),)),


                ],
              ),
              SizedBox(
                height: 10,
              ),


//              open & book section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomText(text: "Открыто: 09.00-22.00", color: green, weight: FontWeight.w400, size: 18,),
                  Container(
                      child: FlatButton.icon(onPressed: () {
                        changeScreen(context, Home());
                        }, icon: Icon(Icons.restaurant_menu), label: CustomText(text: "Сделать заказ")))
                ],
              ),

              // products
              Column(
                children: productProvider.productsByRestaurant
                    .map((item) => GestureDetector(
                  onTap: () {
                    changeScreen(context, Details(product: item,));
                  },
                  child: ProductWidget(
                    product: item,
                  ),
                ))
                    .toList(),
              )
            ],
          )),
    );
  }
}
