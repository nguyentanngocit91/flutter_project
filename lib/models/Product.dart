import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final double price;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/images/product_0.png",
    title: "Mẫu áo 1 Mẫu áo 1 Mẫu áo 1 Mẫu áo 1",
    price: 160000,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/product_1.png",
    title: "Mẫu áo 2",
    price: 199000,
  ),
  Product(
    image: "assets/images/product_2.png",
    title: "Mẫu áo 3",
    price: 180000,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/product_3.png",
    title: "Mẫu áo 4",
    price: 149000,
    bgColor: const Color(0xFFEEEEED),
  ),

    Product(
    image: "assets/images/product_3.png",
    title: "Mẫu áo 4",
    price: 149000,
    bgColor: const Color(0xFFEEEEED),
  ),


    Product(
    image: "assets/images/product_3.png",
    title: "Mẫu áo 4",
    price: 149000,
    bgColor: const Color(0xFFEEEEED),
  ),


    Product(
    image: "assets/images/product_3.png",
    title: "Mẫu áo 4",
    price: 149000,
    bgColor: const Color(0xFFEEEEED),
  ),
];
