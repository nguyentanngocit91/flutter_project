import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../constants.dart';

final formatCurrency = NumberFormat.simpleCurrency();

class ProductCardApi extends StatelessWidget {
  const ProductCardApi({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String image, title,description;
  final VoidCallback press;
  final double price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      
      onTap: press,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        
        child: Column(
          
          children: [
            
            Container(
              
              width: double.infinity,
              decoration: BoxDecoration(
                
                color: bgColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
              ),
              child: Image.network(
                image,
                height: 132,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  /* "vnđ" + price.toString()+"vnđ",*/
                  //price.toString() + " vnđ",
                  NumberFormat.simpleCurrency(locale: 'vi').format(price),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
