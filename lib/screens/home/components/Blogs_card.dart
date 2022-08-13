import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../constants.dart';

final formatCurrency = NumberFormat.simpleCurrency();

class BlogsCard extends StatelessWidget {
  const BlogsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.press,
    required this.bgColor, 
  }) : super(key: key);
  final String image, title, description;
  final VoidCallback press;
  

  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          width: 440, 
       padding: const EdgeInsets.all(defaultPadding / 2),
       decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        height: 140,
       margin: const EdgeInsets.all(8),
       
        child: Row(
          children:<Widget> [
            Card(
              clipBehavior:Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: Image.asset(
                image,
               fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Flexible(child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
                children: <Widget>[
                   Align( alignment: Alignment.centerLeft,
                   
                   child: Row(
                     children:  [
       Text(title, overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(fontSize:15,fontWeight: FontWeight.bold))
                     ],
                   ),),
                    const Padding(padding:  EdgeInsets.all(4.0)),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ],
            ),),
           /* Column(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: defaultPadding / 4),
              ],
            ),*/

          ],
        ),
      ),
    );
  }
}
