import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  final String postUrl;
  const PostView({Key? key, required this.postUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 350,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: NetworkImage(postUrl))),
    );
  }
}
