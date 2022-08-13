import 'package:flutter/material.dart';
import 'package:flutter_project/models/Product.dart';
import 'package:flutter_project/screens/details/details_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';


class NewArrivalProducts extends StatefulWidget {
  const NewArrivalProducts({Key? key}) : super(key: key);

  @override
  _NewArrivalProductsState createState() => _NewArrivalProductsState();
}

class _NewArrivalProductsState extends State<NewArrivalProducts> {
  bool isLoading = false;

  Widget buildEffect() {
      return Shimmer.fromColors(
        direction: ShimmerDirection.rtl,
        baseColor: Colors.grey,
        highlightColor: Colors.blue,
       period: Duration(seconds:3),
       
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            color: Colors.grey,
          ),
        ),
      );
    }
@override
  void initState() {
    
    super.initState();
    getEffect();
  }

  getEffect() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 1), () {});

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: [

 Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Đầm",
            pressSeeAll: () {},
          ),
        ),
      if (isLoading)...[
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: Shimmer.fromColors(
            child: Row(
            children: List.generate(
              demo_product.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  title: demo_product[index].title,
                  image: demo_product[index].image,
                  price: demo_product[index].price,
                  bgColor: demo_product[index].bgColor,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: demo_product[index]),
                        ));
                  },
                ),
              ),
            ),
          ),
          baseColor: Colors.black12,
          highlightColor: Colors.white,
                    
           ),
 
        )
        
        ] else ...[
          
          SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              demo_product.length,
              (index) => Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  title: demo_product[index].title,
                  image: demo_product[index].image,
                  price: demo_product[index].price,
                  bgColor: demo_product[index].bgColor,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: demo_product[index]),
                        ));
                  },
                ),
              ),
            ),
          ),
 
        )
        
        ]
   
      ],
    );
  }
}
