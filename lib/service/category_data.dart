import 'package:myapp/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [
    CategoryModel(id: "0", name: "Pizza", image: "images/pizza.png"),
    CategoryModel(id: "1", name: "Burger", image: "images/burger.png"),
    CategoryModel(id: "2", name: "Chinese", image: "images/chinese.png"),
    CategoryModel(id: "3", name: "Mexican", image: "images/tacos.png"),
  ];
  return categories;
}
