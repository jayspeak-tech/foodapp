import 'package:flutter/material.dart';
import 'package:myapp/model/category_model.dart';
import 'package:myapp/model/food_model.dart';
import 'package:myapp/service/category_data.dart';
import 'package:myapp/service/food_data.dart';
import 'package:myapp/pages/food_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<FoodModel> allFood = [];
  String selectedCategory = "0";

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    allFood = getFood();
  }

  List<FoodModel> get filteredFood =>
      allFood.where((item) => item.categoryId == selectedCategory).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("images/logo.png", height: 50, width: 110, fit: BoxFit.contain),
                    Text("Order your favourite food!"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),

            // Search bar
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xffececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search food item...",
                        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 30.0),
                ),
              ],
            ),
            SizedBox(height: 20.0),

            // Category row
            Container(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    name: categories[index].name!,
                    image: categories[index].image!,
                    categoryindex: categories[index].id!,
                    selectedCategory: selectedCategory,
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index].id!;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10.0),

            // Food grid — filtered by selected category
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.69,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 15.0,
                  ),
                  itemCount: filteredFood.length,
                  itemBuilder: (context, index) {
                    final item = filteredFood[index];
                    return FoodTile(
                      name: item.name!,
                      image: item.image!,
                      price: item.price!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetails(foodModel: item),
                          ),
                        );
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
}

class CategoryTile extends StatelessWidget {
  final String name, image, categoryindex, selectedCategory;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.name,
    required this.image,
    required this.categoryindex,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedCategory == categoryindex;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffef2b39) : Color(0xffececf8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: isSelected ? 50 : 40,
              width: isSelected ? 50 : 40,
              fit: BoxFit.cover,
            ),
            SizedBox(width: isSelected ? 8.0 : 10.0),
            Text(name, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  final String name, image;
  final int price;
  final VoidCallback onTap;

  const FoodTile({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xffececf8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(image, height: 100, width: 100, fit: BoxFit.cover),
          ),
          SizedBox(height: 10.0),
          Text(name, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
          SizedBox(height: 2.0),
          Text("\$$price", style: TextStyle(fontSize: 13.0, color: Colors.grey[600])),
          SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}