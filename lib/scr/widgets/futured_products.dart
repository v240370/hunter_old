import 'package:flutter/material.dart';
import 'package:hunter/scr/helpers/screen_navigation.dart';
import 'package:hunter/scr/helpers/style.dart';
import 'package:hunter/scr/providers/product.dart';
import 'package:hunter/scr/screens/details.dart';
import 'package:hunter/scr/widgets/title.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'loading.dart';


class FeaturedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          itemBuilder: (_, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        Details(
                          product: productProvider.products[index],
                        ));
                  },
                  child: Container(
                    height: 250,
                    width: 225,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(-2, -2),
                              blurRadius: 1),
                        ]),

                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0)),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Loading(),
                                  )),
                              Center(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: productProvider.products[index].image,
                                  height: 135,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                              padding: const EdgeInsets.all(6.0),

                              child: CustomText(
                                text: productProvider.products[index].name ??
                                    "id null",
                              ),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: GestureDetector(
                                onTap: (){
//                                  setState(() {
//                                    productProvider.products[index].liked = !productProvider.products[index].liked;
//                                  });
//                                  productProvider.likeDislikeProduct(userId: user.userModel.id, product: productProvider.products[index], liked: productProvider.products[index].liked);
                                },
                                child: Container(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomText(
                                    // text: productProvider.products[index].rating
                                      text: "Вес ${productProvider.products[index].netto} гр."
                                        .toString(),
                                    color: grey,
                                    size: 14.0,
                                  ),
                                ),

//                                SizedBox(
//                                  width: 2,
//                                ),
//                                Icon(
//                                  Icons.star,
//                                  color: red,
//                                  size: 16,
//                                ),
//                                Icon(
//                                  Icons.star,
//                                  color: red,
//                                  size: 16,
//                                ),
//                                Icon(
//                                  Icons.star,
//                                  color: red,
//                                  size: 16,
//                                ),
//                                Icon(
//                                  Icons.star,
//                                  color: grey,
//                                  size: 16,
//                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomText(
                                text:
                                "${productProvider.products[index].price} RUB",
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
