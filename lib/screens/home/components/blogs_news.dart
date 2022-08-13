// ignore: unused_import

import 'package:flutter/material.dart';
import 'section_title.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/models/Blogs.dart';
import 'Blogs_card.dart';
import 'package:flutter_project/screens/details/blogs_details_screen.dart';
import 'package:flutter_project/screens/home/components/shimmerEffect.dart';
import 'package:shimmer/shimmer.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({Key? key}) : super(key: key);

  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  bool isLoading = false;

  Widget buildEffect() {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
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
    await Future.delayed(Duration(seconds: 3), () {});

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
            title: "Blogs",
            pressSeeAll: () {},
          ),
        ),

         if (isLoading)...[
           SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Shimmer.fromColors(

             child: Column(
            children: List.generate(
              content_blogs.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: BlogsCard(
                     title: content_blogs[index].title,
                     image: content_blogs[index].image,
                     description: content_blogs[index].description,
                     bgColor: content_blogs[index].bgColor,
                     press: () {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>
                                 DetailsScreenBlogs(blog: content_blogs[index]),
                           ));
                     },
                   ),
              ),
            ),
          ),

          baseColor: Colors.black12,
          highlightColor: Colors.white,
          direction:ShimmerDirection.rtl,
            period: Duration(seconds: 5),
          ),
        
        )


         ]else ...[

         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: List.generate(
              content_blogs.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: BlogsCard(
                     title: content_blogs[index].title,
                     image: content_blogs[index].image,
                     description: content_blogs[index].description,
                     bgColor: content_blogs[index].bgColor,
                     press: () {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>
                                 DetailsScreenBlogs(blog: content_blogs[index]),
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
