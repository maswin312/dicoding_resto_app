import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resto_app/restaurant.dart';
import 'package:resto_app/restaurant_detail.dart';

class RestaurantListScreen extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Resto App'),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Restaurant",
                    style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Recommendation restaurant for you!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/local_restaurant.json'),
                  builder: (context, snapshot) {
                    final List<Restaurant> restaurant =
                        parseArticles(snapshot.data);
                    return ListView.builder(
                      itemCount: restaurant.length,
                      itemBuilder: (context, index) {
                        return _buildRestaurantList(context, restaurant[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildArticleItem(BuildContext context, Restaurant restaurant) {
  //   return ListTile(
  //     contentPadding:
  //         const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //     leading: Image.network(
  //       restaurant.pictureId,
  //       width: 100,
  //       errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
  //     ),
  //     title: Text(restaurant.name),
  //     subtitle: Text(restaurant.city),
  //     onTap: () {
  //       // Navigator.pushNamed(context, ArticleDetailPage.routeName,
  //       //     arguments: restaurant);
  //     },
  //   );
  // }

  Widget _buildRestaurantList(BuildContext context, Restaurant restaurant) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetail.routeName,
            arguments: restaurant);
      },
      child: Hero(
        tag: restaurant.pictureId,
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 400,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  restaurant.pictureId,
                  width: 120,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      RatingBarIndicator(
                        rating: restaurant.rating.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 25,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        restaurant.city,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        restaurant.description,
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
