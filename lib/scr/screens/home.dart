import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter/scr/helpers/screen_navigation.dart';
import 'package:hunter/scr/helpers/style.dart';
import 'package:hunter/scr/providers/app.dart';
import 'package:hunter/scr/providers/category.dart';
import 'package:hunter/scr/providers/product.dart';
import 'package:hunter/scr/providers/restaurant.dart';
import 'package:hunter/scr/screens/cart.dart';
import 'package:hunter/scr/screens/category.dart';
import 'package:hunter/scr/screens/login.dart';
import 'package:hunter/scr/screens/map.dart';
import 'package:hunter/scr/screens/order.dart';
import 'package:hunter/scr/screens/product_search.dart';
import 'package:hunter/scr/screens/restaurant.dart';
import 'package:hunter/scr/screens/restaurants_search.dart';
import 'package:hunter/scr/screens/zal.dart';
import 'package:hunter/scr/screens/zal2.dart';
import 'package:hunter/scr/widgets/categories.dart';
import 'package:hunter/scr/widgets/futured_products.dart';
import 'package:hunter/scr/widgets/loading.dart';
import 'package:hunter/scr/widgets/restaurant.dart';
import 'package:hunter/scr/widgets/title.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    restaurantProvider.loadSingleRestaurant();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: primary,
        title: CustomText(
          text: "Доставка еды по Волжскому",
          color: white,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, CartScreen());
                },
              ),
            ],
          ),
        ],
      ),




      drawer: Drawer(

        child: ListView(

          children: <Widget>[
            Container(
              width: 125,
              height: 125,
              color: Colors.black,

              child: Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/logo2.jpg?alt=media&token=18e641a0-c54a-486c-b597-08651f36bc80"),

            ),
            Container(
              height: 80,
              child: UserAccountsDrawerHeader(

                decoration: BoxDecoration(
                  color: black,


                ),

                accountName: CustomText(
                  text: user.userModel?.name ?? "username lading...",
                  color: Colors.black,
                  weight: FontWeight.bold,
                  size: 18,
                ),
                accountEmail: CustomText(
                  text: user.userModel?.email ?? "email loading...",
                  color: Colors.black,
                ),
              ),
            ),

            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: "Домой"),
            ),
//            ListTile(
//              onTap: () {},
//              leading: Icon(Icons.fastfood),
//              title: CustomText(text: "Food I like"),
//            ),
//            ListTile(
//              onTap: () {},
//              leading: Icon(Icons.restaurant),
//              title: CustomText(text: "Liked restaurants"),
//            ),
            ListTile(
              onTap: () async{
                await user.getOrders();
                changeScreen(context, OrdersScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "Заказы"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartScreen());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Корзина"),
            ),
             // ListTile(
             //  onTap: () {
             //     changeScreen(context, MyApp());
             //   },
             //   leading: Icon(Icons.map),
             //   title: CustomText(text: "Карта проезда"),
             // ),
            ListTile(
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "Выход"),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: app.isLoading
          ? Container(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Loading()],
        ),
      )
          : SafeArea(
        child: ListView(
          children: <Widget>[
            Container(

      child: Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/logo1.jpg?alt=media&token=f7cf4437-e1ca-4620-b75e-1118756e9d17"),
            ),
            Container(

              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: red,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern)async{
                        app.changeLoading();
                        if(app.search == SearchBy.PRODUCTS){
                          await productProvider.search(productName: pattern);
                          changeScreen(context, ProductSearchScreen());
                        }else{
                          await restaurantProvider.search(name: pattern);
                          changeScreen(context, RestaurantsSearchScreen());
                        }
                        app.changeLoading();
                      },
                      decoration: InputDecoration(
                        hintText: "Найти блюда или рестораны",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomText(text: "Поиск по:", color: grey, weight: FontWeight.w300,),
                DropdownButton<String>(
                  value: app.filterBy,
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w300
                  ),
                  icon: Icon(Icons.filter_list,
                    color: primary,),
                  elevation: 0,
                  onChanged: (value){
                    if (value == "Products"){
                      app.changeSearchBy(newSearchBy: SearchBy.PRODUCTS);
                    }else{
                      app.changeSearchBy(newSearchBy: SearchBy.RESTAURANTS);
                    }
                  },
                  items: <String>["Products", "Restaurants"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value));
                  }).toList(),

                ),
              ],
            ),
            Divider(),
//            SizedBox(
//              height: 10,
//            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
//                              app.changeLoading();
                        await productProvider.loadProductsByCategory(
                            categoryName:
                            categoryProvider.categories[index].name);

                        changeScreen(
                            context,
                            CategoryScreen(
                              categoryModel:
                              categoryProvider.categories[index],
                            ));

//                              app.changeLoading();

                      },
                      child: CategoryWidget(
                        category: categoryProvider.categories[index],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Рекомендуем",
                    size: 20,
                    color: grey,
                  ),
                ],
              ),
            ),
            FeaturedWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Наши залы",
                    size: 20,
                    color: grey,
                  ),
                ],
              ),
            ),



      Padding(padding: EdgeInsets.all(2),
          child: Stack(
            children: <Widget>[

              GestureDetector(
                onTap: () {
                  changeScreen(context, ZalScreen());
                },
                child: Container(

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

                          Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal1%2FIMG_0610-scaled.jpg?alt=media&token=90d05da8-c687-42ca-9e26-de6cfc1deca3"),

                        ],
                      )),
                ),
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
                        TextSpan(text: "Hunter, Нижний Зал\n",
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
      ),

        Padding(padding: EdgeInsets.all(2),
          child: Stack(
              children: <Widget>[

              GestureDetector(
              onTap: () {
          changeScreen(context, Zal2Screen());
          },
          child: Container(

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
                                Image.network("https://firebasestorage.googleapis.com/v0/b/hunter-9f58f.appspot.com/o/zal2%2FIMG_5608-scaled.jpg?alt=media&token=42a8ad6f-1703-448e-a3a9-5387c5cda2e3"),

                              ],
                            )),
                      ),
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
                              TextSpan(text: "Hunter, Верхний Зал\n",
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
            ),





//            Column(
//              children: restaurantProvider.restaurants
//                  .map((item) => GestureDetector(
//                onTap: () async {
//                  app.changeLoading();
//
//                  await productProvider.loadProductsByRestaurant(
//                      restaurantId: item.id);
//                  app.changeLoading();
//
//                  changeScreen(
//                      context,
//                      RestaurantScreen(
//                        restaurantModel: item,
//                      ));
//                },
//                child: RestaurantWidget(
//                  restaurant: item,
//                ),
//              ))
//                  .toList(),
//            )
            ],
        ),
      ),
    );
  }
}
