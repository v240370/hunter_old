import 'package:flutter/material.dart';
import 'package:hunter/scr/providers/app.dart';
import 'package:hunter/scr/providers/category.dart';
import 'package:hunter/scr/providers/product.dart';
import 'package:hunter/scr/providers/restaurant.dart';
import 'package:hunter/scr/providers/user.dart';
import 'package:hunter/scr/screens/login.dart';
import 'package:hunter/scr/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'scr/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider()),
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
    ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),
  ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hunter',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController()
      )));
}

class ScreensController extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);

    switch (auth.status) {
      case Status.Uninitialized:
        return LoginScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return Home();
    }
  }
}
