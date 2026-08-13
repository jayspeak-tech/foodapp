import 'package:flutter/foundation.dart';
import 'package:myapp/model/pizzamodel.dart';

List<PizzaModel> getPizza(){
  List<PizzaModel> pizza=[];
  PizzaModel pizzaModel= new PizzaModel();

  pizzaModel.name="Cheese Pizza";
  pizzaModel.image="images/pizza1.jpg";
  pizza.add(pizzaModel);
  pizzaModel= new PizzaModel();

  pizzaModel.name="Margherita pizza";
  pizzaModel.image="images/pizza2.jpg";
  pizza.add(pizzaModel);
  pizzaModel= new PizzaModel();


  return pizza;
}
