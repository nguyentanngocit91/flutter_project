import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home/components/product_card_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_project/screens/details/details_screen_api.dart';
import '../../../constants.dart';

class LoadMore_ListView_Pagination extends StatefulWidget {
  const LoadMore_ListView_Pagination({Key? key, this.bgColorfake = const Color(0xFFEFEFF2)}) : super(key: key);
final Color bgColorfake;
  @override
  _LoadMore_ListView_PaginationState createState() => _LoadMore_ListView_PaginationState();
}

class _LoadMore_ListView_PaginationState extends State<LoadMore_ListView_Pagination> {

// We will fetch data from this Rest api
  final _baseUrl = 'https://fakestoreapi.com/products';

  // At the beginning, we fetch the first 20 posts
  int _page = 0;
  int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _posts = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
          await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
      setState(() {
        _posts = json.decode(res.body);
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  } 



  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {

    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res =
            await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));

        final List fetchedPosts = json.decode(res.body);
        if (fetchedPosts.length > 0) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }


    // The controller for the ListView
  late ScrollController _controller;

    @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = new ScrollController()..addListener(_loadMore);
  }

    @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

   var bgColorfake=const Color(0xFFEFEFF2);
   return Container(
    height:MediaQuery.of(context).size.height,
      child: _isFirstLoadRunning
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                    
                Expanded(
            
                  child: ListView.builder(
                   controller: _controller,
                    itemCount: _posts.length,
                     itemBuilder: (_, index) => Card(
                      
                      child: Row(

                       children: List.generate(
                      _posts.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                          child: ProductCardApi(
                                  title: _posts[index]['title'],
                                  image: _posts[index]['image'],
                                  price: _posts[index]['price'],
                                  description: _posts[index]['description'],
                                  bgColor: bgColorfake,
                                  press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsScreen(product: _posts[index]),
                                      ));
                              },
                          ),
)
                         ),
                      ),
                       
                     ),
                           
                   ),
           
                ),

                // when the _loadMore function is running
                if (_isLoadMoreRunning == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            ),
    );

  }
}
