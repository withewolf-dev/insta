import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insta/model/user.dart';
import 'package:insta/provider/user_provider.dart';
import 'package:insta/resource/firestore_method.dart';
import 'package:insta/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key, required this.photo, required this.ctx})
      : super(key: key);
  final Uint8List photo;
  final BuildContext ctx;
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(
      {required String uid,
      required String username,
      required String profImage}) async {
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
    final User user = Provider.of<UserProvider>(widget.ctx).getUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Post to',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: <Widget>[
          TextButton(
            onPressed: (() => postImage(
                uid: user.uid,
                username: user.username,
                profImage: user.photoUrl)),
            child: const Text(
              "Post",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            isLoading
                ? const LinearProgressIndicator()
                : const Padding(padding: EdgeInsets.only(top: 0.0)),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.photoUrl,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        hintText: "Write a caption...",
                        border: InputBorder.none),
                    maxLines: 8,
                  ),
                ),
                SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: AspectRatio(
                    aspectRatio: 487 / 451,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(
                              (widget.photo),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
