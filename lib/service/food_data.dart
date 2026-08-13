// lib/service/food_data.dart (replaces pizza_data.dart and burger_data.dart)
import 'package:myapp/model/food_model.dart';

List<FoodModel> getFood() {
  List<FoodModel> food = [];

  food.add(FoodModel(name: "Cheese Pizza", image: "images/pizza1.png", price: 50, categoryId: "0"));
  food.add(FoodModel(name: "Margherita pizza", image: "images/pizza2.png", price: 80, categoryId: "0"));

  food.add(FoodModel(name: "Classic Burger", image: "images/burger1.png", price: 40, categoryId: "1"));
  food.add(FoodModel(name: "Cheese Burger", image: "images/burger2.png", price: 45, categoryId: "1"));

  food.add(FoodModel(name: "Chicken Tacos", image: "images/tacos.png", price: 35, categoryId: "2"));

  return food;
}
