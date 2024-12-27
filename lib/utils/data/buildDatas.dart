import 'package:flutter/material.dart';
import 'package:my_leo/view/mainScreen/HomeScreen/HomeScreen.dart';
import 'package:my_leo/view/mainScreen/expenseScreen/expenseScreen.dart';
import 'package:my_leo/view/mainScreen/notesScreen/noteScreen.dart';
import 'package:my_leo/view/mainScreen/profileScreen/profileScreen.dart';

List<Widget> screenList = [
  Homescreen(),
  ExpenseManager(),
  NoteScreen(),
  Profilescreen()
];

class ExpenseCategories {
  List<Map> Categories = [
    {
      'icon': Icon(Icons.directions_bike, color: Colors.white),
      'label': 'Fuel',
      'color': Colors.orange,
    },
    {
      'icon': Icon(Icons.fastfood, color: Colors.white),
      'label': 'Food',
      'color': Colors.red,
    },
    {
      'icon': Icon(Icons.local_cafe, color: Colors.white),
      'label': 'Beverages',
      'color': Colors.brown,
    },
    {
      'icon': Icon(Icons.shopping_cart, color: Colors.white),
      'label': 'Groceries',
      'color': Colors.green,
    },
    {
      'icon': Icon(Icons.home, color: Colors.white),
      'label': 'Rent',
      'color': Colors.blue,
    },
    {
      'icon': Icon(Icons.electric_bolt, color: Colors.white),
      'label': 'Electricity',
      'color': Colors.yellow,
    },
    {
      'icon': Icon(Icons.water_drop, color: Colors.white),
      'label': 'Water',
      'color': Colors.cyan,
    },
    {
      'icon': Icon(Icons.wifi, color: Colors.white),
      'label': 'Internet',
      'color': Colors.teal,
    },
    {
      'icon': Icon(Icons.phone, color: Colors.white),
      'label': 'Mobile',
      'color': Colors.indigo,
    },
    {
      'icon': Icon(Icons.school, color: Colors.white),
      'label': 'Education',
      'color': Colors.purple,
    },
    {
      'icon': Icon(Icons.health_and_safety, color: Colors.white),
      'label': 'Health',
      'color': Colors.pink,
    },
    {
      'icon': Icon(Icons.spa, color: Colors.white),
      'label': 'Beauty',
      'color': Colors.amber,
    },
    {
      'icon': Icon(Icons.shopping_bag, color: Colors.white),
      'label': 'Shopping',
      'color': Colors.deepOrange,
    },
    {
      'icon': Icon(Icons.celebration, color: Colors.white),
      'label': 'Entertainment',
      'color': Colors.deepPurple,
    },
    {
      'icon': Icon(Icons.directions_car, color: Colors.white),
      'label': 'Car Maintenance',
      'color': Colors.lightGreen,
    },
    {
      'icon': Icon(Icons.pets, color: Colors.white),
      'label': 'Pet Care',
      'color': Colors.lightBlue,
    },
    {
      'icon': Icon(Icons.local_hospital, color: Colors.white),
      'label': 'Medical',
      'color': Colors.lime,
    },
    {
      'icon': Icon(Icons.flight, color: Colors.white),
      'label': 'Travel',
      'color': Colors.blueGrey,
    },
    {
      'icon': Icon(Icons.attach_money, color: Colors.white),
      'label': 'Savings',
      'color': Colors.greenAccent,
    },
    {
      'icon': Icon(Icons.volunteer_activism, color: Colors.white),
      'label': 'Donations',
      'color': Colors.orangeAccent,
    },
  ];
}
