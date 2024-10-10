import 'package:flutter/material.dart';
import 'meal_service.dart';
import 'meal.dart' as meal_model; // Using prefix for meal.dart

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late Future<meal_model.Meal> futureMeal;
  bool _showInstructions = false; // Start with instructions hidden
  bool _showIngredients = false; // Start with ingredients hidden
  double userRating = 0; // Variable to store the user's rating
  bool isFavorited = false; // Variable to track favorite status

  @override
  void initState() {
    super.initState();
    futureMeal = MealService().fetchRandomMeal();
  }

  void _fetchNewMeal() {
    setState(() {
      futureMeal = MealService().fetchRandomMeal(); // Fetch a new meal
      _showInstructions = false; // Reset the instructions visibility
      _showIngredients = false; // Reset the ingredients visibility
      userRating = 0; // Reset user rating
      isFavorited = false; // Reset favorite status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Meal Generator"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.red[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<meal_model.Meal>(
          future: futureMeal,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final meal = snapshot.data!;
              double width = MediaQuery.of(context).size.width * 0.9;

              return Center(
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                meal.strMealThumb,
                                height: width * 0.5,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return const Text('Failed to load image');
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    meal.strMeal,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text('ID: ${meal.idMeal}',
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text('${meal.strCategory}',
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[100],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text('${meal.strArea}',
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      userRating = index + 1;
                                    });
                                  },
                                  child: Icon(
                                    index < userRating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 32,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Instructions',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  if (_showInstructions)
                                    Text(meal.strInstructions,
                                        textAlign: TextAlign.center),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showInstructions =
                                            !_showInstructions; // Toggle instructions visibility
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 16.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 249, 193, 193),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 4.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        _showInstructions
                                            ? 'Hide Instructions'
                                            : 'Show Instructions',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255,
                                                0,
                                                0,
                                                0)), // Change text color to blue
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showIngredients =
                                            !_showIngredients; // Toggle ingredients visibility
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 16.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 238, 180),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 4.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        _showIngredients
                                            ? 'Hide Ingredients'
                                            : 'Show Ingredients',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255,
                                                0,
                                                0,
                                                0)), // Change text color to blue
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  if (_showIngredients) ...[
                                    const SizedBox(height: 10),
                                    for (var ingredient
                                        in meal.getIngredients())
                                      if (ingredient != null)
                                        Text(ingredient,
                                            textAlign: TextAlign.center),
                                  ],
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: _fetchNewMeal,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side:
                                            BorderSide(color: Colors.red[200]!),
                                      ),
                                    ),
                                    child: Text('Next Recipe',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorited =
                                  !isFavorited; // Toggle favorite status
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: isFavorited ? Colors.red : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Opacity(
                              opacity: 0.7,
                              child: Icon(
                                isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorited ? Colors.red : Colors.grey,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text('No meal found.'));
            }
          },
        ),
      ),
    );
  }
}
