// lib/pages/food_details.dart (renamed from pizza_details.dart, same logic, just FoodModel instead of PizzaModel)

import 'package:flutter/material.dart';
import 'package:myapp/model/food_model.dart';

class FoodDetails extends StatefulWidget {
  final FoodModel foodModel;

  const FoodDetails({super.key, required this.foodModel});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(widget.foodModel.image!, height: 220, width: 220, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 30.0),
              Text(widget.foodModel.name!, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
              SizedBox(height: 8.0),
              Text(
                "\$${widget.foodModel.price}",
                style: TextStyle(fontSize: 18.0, color: Color(0xffef2b39), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text("Quantity", style: TextStyle(fontSize: 15.0)),
                  Spacer(),
                  GestureDetector(
                    onTap: () => setState(() { if (quantity > 1) quantity--; }),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Color(0xffececf8), borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.remove, size: 18),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Text(quantity.toString(), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                  SizedBox(width: 12.0),
                  GestureDetector(
                    onTap: () => setState(() => quantity++),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Color(0xffececf8), borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.add, size: 18),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffef2b39),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Add to cart — \$${(widget.foodModel.price ?? 0) * quantity}",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}