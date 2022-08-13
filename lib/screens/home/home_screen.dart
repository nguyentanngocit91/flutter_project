
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_project/constants.dart';
import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';

import 'components/bottomNavigationBar.dart';
import 'components/carousel_slider.dart';

import 'components/SearchPage.dart';
import 'components/blogs_news.dart';

import 'components/loadmore_news_api.dart';

import 'components/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NavDrawer())),
            },
            icon: SvgPicture.asset("assets/icons/menu.svg"),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset("assets/images/nina.webp"),
              Image.asset("images/nina.webp"),
    
              const SizedBox(width: defaultPadding / 1),
            ],
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/Search.svg"),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage())),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Categories(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: MySlidePage(),
              ),
              NewArrivalProducts(),
              PopularProducts(),
              BlogsPage(),
              LoadMore_ListView_Pagination(),
            ],
          ),
        ),
        bottomNavigationBar: BTNavigationBar(),
    
        /* bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              label: 'Messages',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
       
         
          ],
        ),  */
    
        /* body: Container(
          height: 1000.0,
          alignment: Alignment.center,
          //child: const MySlidePage(title: "title"),
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: <Widget>[
                    Categories(),
                    MySlidePage(),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    NewArrivalProducts(),
                    PopularProducts(),
                  ],
                ),
              ),
            ]),
          ),
        ),*/
      ),
    );
  }
}
