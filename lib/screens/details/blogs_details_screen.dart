import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/models/Blogs.dart';

import 'package:intl/intl.dart';

import 'components/color_dot.dart';

class DetailsScreenBlogs extends StatelessWidget {
  const DetailsScreenBlogs({Key? key, required this.blog}) : super(key: key);

  final Blogs blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blog.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            blog.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          blog.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        
                      ),
                      const SizedBox(width: defaultPadding),
                      
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                   
                  ),

                 Text(
                        blog.description,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                  const SizedBox(height: defaultPadding / 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
