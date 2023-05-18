import 'package:flutter/material.dart';
import 'package:resto_app/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;
  const RestaurantDetail({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    Widget _buildRestaurantMenus(BuildContext contex, Drink drinks) {
      return Card(
        color: Colors.amber,
        child: SizedBox(
          width: 120,
          child: Center(
            child: Text(
              drinks.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    restaurant.pictureId,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.place,
                    size: 24.0,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    restaurant.city,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                restaurant.description,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Food",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus.foods.length,
                    itemBuilder: (context, index) {
                      Drink foods = restaurant.menus.foods[index];
                      return _buildRestaurantMenus(context, foods);
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Drinks",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus.drinks.length,
                    itemBuilder: (context, index) {
                      Drink drinks = restaurant.menus.drinks[index];
                      return _buildRestaurantMenus(context, drinks);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
