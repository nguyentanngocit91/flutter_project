import 'package:flutter/material.dart';

class Product {
  final String image, title,description;
  final double price;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}
