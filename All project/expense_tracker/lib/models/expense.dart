import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
//intl là thư viện dành cho calendar
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

//uuid là dùng để tạo 1 id duy nhất và cách tạo của chúng random giống objectId của bên nodejs
const uuid = Uuid();

//enum dùng để tạo danh mục như ví dụ bên dưới
enum Category { food, travel, leisure, work }

// tạo danh mục icon không thể thay đổi
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.flight_takeoff,
  Category.travel: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  //hàm dùng để phân biệt category và tổng hợp các chí phí của từng category để viết biểu đồ
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount; //sum=sum + expense.amount
    }
    return sum;
  }
}
