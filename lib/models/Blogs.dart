import 'package:flutter/material.dart';

class Blogs {
  final String image, title, description;
  final Color bgColor;

  Blogs({
    required this.image,
    required this.title,
    required this.description,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

// ignore: non_constant_identifier_names
List<Blogs> content_blogs = [
  Blogs(
    image: "assets/images/thietkeweb.png",
    title: "Thiết kế website ",
    description:
        "Website, đầy đủ tính năng chính của website. Tất cả các tính năng đều có thể quản trị nội dung thông qua trang quản trị dễ dàng, bảo mật.",
    bgColor: const Color(0xFFFEFBF9),
  ),
  Blogs(
    image: "assets/images/webhosting461-4412.png",
    title: "Web hosting",
    description: "Là giải pháp cho các cá nhân hoặc doanh nghiệp muốn có một website giới thiệu, giao dịch thương mại trên Internet một cách hiệu quả và tiết kiệm chi phí.",
  ),
  Blogs(
    image: "assets/images/domain1756-3179.png",
    title: "Domain",
    description: "Domain hỗ trợ đầy đủ các chức năng thay đổi các record hoàn toàn miễn phí thông qua Controlpanel:A Record,MX Record.",
    bgColor: const Color(0xFFF8FEFB),
  ),
  Blogs(
    image: "assets/images/emailserver4142-2359.png",
    title: "Email server",
    description: "Email Server là giải pháp Mail dành cho các công ty có nhu cầu sử dụng số lượng Mail nhiều để giao dịch thương mại đòi hỏi tốc độ nhanh.",
    bgColor: const Color(0xFFEEEEED),
  ),
];
