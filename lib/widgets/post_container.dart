import 'package:flutter/material.dart';
import 'package:insta/widgets/post_card_bottomrow.dart';
import 'package:insta/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final snap;
  const PostContainer({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        children: [
          PostCardTopRow(
              displayPicture: snap['profImage'], username: snap['username']),
          const SizedBox(
            height: 10,
          ),
          PostView(
            postUrl: snap["postUrl"],
          ),
          PostCardBottomRow(snap: snap),
        ],
      ),
    );
  }
}
