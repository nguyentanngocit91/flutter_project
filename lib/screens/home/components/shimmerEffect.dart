// ignore: unused_import

import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

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
    await Future.delayed(Duration(seconds: 7), () {});

    setState(() {
      isLoading = false;
    });
  }


  


}
