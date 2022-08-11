import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 350,
      ),
      decoration: const BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1644982652063-1a9b8d24f0f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'))),
    );
  }
}
