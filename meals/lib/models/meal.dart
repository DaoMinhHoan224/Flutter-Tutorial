enum Complexity {
  simple, //đơn giản
  challenging, //thử thách
  hard, //khó
}

enum Affordability {
  affordable, //có thể chi trả
  pricey, //đắt tiền
  luxurious, //sang trọng
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients; //thành phần
  final List<String> steps; //bước
  final int duration; //khoảng thời gian
  final Complexity complexity; //độ phức tạp
  final Affordability affordability; //khả năng chi trả
  final bool isGlutenFree; //có glucozo
  final bool isLactoseFree; //có lactozo
  final bool isVegan; //thuần ăn chay
  final bool isVegetarian; //ăn chay nửa vời
}
