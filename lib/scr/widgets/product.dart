import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter/scr/helpers/screen_navigation.dart';
import 'package:hunter/scr/helpers/style.dart';
import 'package:hunter/scr/models/products.dart';
import 'package:hunter/scr/providers/product.dart';
import 'package:hunter/scr/providers/restaurant.dart';
import 'package:hunter/scr/screens/restaurant.dart';
import 'package:hunter/scr/widgets/title.dart';
import 'package:provider/provider.dart';


class ProductWidget extends StatelessWidget {
final ProductModel product;

const ProductWidget({Key key, this.product}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   final restaurantProvider = Provider.of<RestaurantProvider>(context);
   final productProvider = Provider.of<ProductProvider>(context);


   return  Padding(
     padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
     child: Container(
       height: 140,
       decoration: BoxDecoration(
           color: white,
           borderRadius: BorderRadius.circular(20),
           boxShadow: [
             BoxShadow(
                 color: Colors.grey[300],
                 offset: Offset(-2, -1),
                 blurRadius: 5),
           ]
       ),
//            height: 160,
       child: Row(
         children: <Widget>[
           Container(
             width: 140,
             height: 120,
             child: ClipRRect(
               borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(20),
                 topLeft: Radius.circular(20),
               ),
               child: Image.network(product.image, fit: BoxFit.fill,),
             ),
           ),
           Expanded(
             child: Column(
               children: <Widget>[
                 Row(
                   mainAxisAlignment:
                   MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CustomText(
                         text: product.name,
                       ),
                     ),
                     ),
                     Padding(
                       padding: EdgeInsets.all(8),
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius:
                             BorderRadius.circular(20),
                             color: white,
                             boxShadow: [
                               BoxShadow(
                                   color: Colors.grey[300],
                                   offset: Offset(1, 1),
                                   blurRadius: 4),
                             ]),
                         child: Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Icon(
                             Icons.favorite_border,
                             color: red,
                             size: 18,
                           ),
                         ),
                       ),
                     )
                   ],
                 ),

                 SizedBox(
                   height: 25,
                 ),

                 Padding(
                   padding: const EdgeInsets.only(left: 4),
                   child: Row(
                     children: <Widget>[
                       CustomText(text: "доставка: Hunter", color: grey, weight: FontWeight.w300, size: 14,),
                       SizedBox(width: 10,),
//                       GestureDetector(
//                           onTap: ()async{
//                             await productProvider.loadProductsByRestaurant(
//                                 restaurantId: product.restaurantId);
//                             await restaurantProvider.loadSingleRestaurant(restaurantId: product.restaurantId);
//                             changeScreen(context, RestaurantScreen(restaurantModel: restaurantProvider.restaurant,));
//                           },
//                           child: CustomText(text: product.restaurant, color: black, weight: FontWeight.w300, size: 14,)),

                     ],
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: CustomText(
                             text: "Вес ${product.netto.toString()} гр.",
                             color: grey,
                             size: 14.0,
                           ),
                         ),
                        ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right:8.0),
                       child: CustomText(text: "Цена ${product.price} RUB",weight: FontWeight.bold,),
                     ),
                   ],
                 ),


               ],
             ),
           )
         ],
       ),
     ),
   );
 }

  }