import 'package:flutter/material.dart';

import '../models/affordability.dart';
import '../models/complexity.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key key,
    @required this.meal,
  }) : super(key: key);

  void _onMealSelection(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.ROUTE,
      arguments: meal,
    );
  }

  String get complexityString {
    switch (meal.complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
    }
    return "";
  }

  String get affordabilityString {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    const radius = const Radius.circular(12);
    const borderRadius = const BorderRadius.all(radius);

    return Container(
      child: InkWell(
        onTap: () => _onMealSelection(context),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: radius,
                      topRight: radius,
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 0,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        meal.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(height: 6),
                          Text("${meal.duration} min"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(Icons.work),
                          SizedBox(height: 6),
                          Text("$complexityString"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(Icons.attach_money),
                          SizedBox(height: 6),
                          Text("$affordabilityString"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
