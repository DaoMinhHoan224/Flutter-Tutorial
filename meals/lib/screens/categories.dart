import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: 'Some title',
              meals: [],
            ))); //Navigator.push(context,route);//
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //trục chính từ trên xuống chia làm 2 cột
            crossAxisCount: 2,
            //xác định tỷ lệ giữa chiều rộng và chiều cao của mỗi phần tử con trong lưới.
            childAspectRatio: 3 / 2,
            //khoảng cách giữa các cột và giữa các trục là 20
            crossAxisSpacing: 20,
            //khoảng cách giữa các hàng là 20
            mainAxisSpacing: 20,
          ),
          children: [
            //avalableCategories.map((category) => CategoryGridItem(category:category)).toList();
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context);
                },
              )
          ]),
    );
  }
}
