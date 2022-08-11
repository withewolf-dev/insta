import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insta/resource/firestore_method.dart';
import 'package:insta/utils/utils.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key, required this.photo}) : super(key: key);
  final Uint8List photo;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        widget.photo,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Posted!',
        );
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  // void clearImage() {
  //   setState(() {
  //     _file = null;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: MemoryImage(widget.photo, scale: 0.5)),
        ),
      ))),
    );
  }
}
