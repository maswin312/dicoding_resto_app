import 'package:flutter/material.dart';
import 'package:resto_app/restaurant.dart';
import 'package:resto_app/restaurant_detail.dart';
import 'package:resto_app/restaurant_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto App',
      initialRoute: RestaurantListScreen.routeName,
      routes: {
        RestaurantListScreen.routeName: (context) =>
            const RestaurantListScreen(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
