import 'package:flutter/material.dart';

class InstagramLogo extends StatelessWidget {
  final double width;
  final double height;
  const InstagramLogo({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/instagram-logo.png'),
              fit: BoxFit.cover)),
    );
  }
}
