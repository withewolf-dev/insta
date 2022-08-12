import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta/model/user.dart';
import 'package:insta/provider/user_provider.dart';
import 'package:insta/screen/comment_screen.dart';
import 'package:insta/utils/utils.dart';
import 'package:insta/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostCardBottomRow extends StatefulWidget {
  final snap;
  const PostCardBottomRow({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostCardBottomRow> createState() => _PostCardBottomRowState();
}

class _PostCardBottomRowState extends State<PostCardBottomRow> {
  int commentLen = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      setState(() {
        commentLen = snap.docs.length;
      });
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).getUser;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FavoriteAnimatedIcon(user: user!, snap: widget.snap),
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        postId: widget.snap['postId'].toString(),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.mode_comment_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send_outlined),
                )
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_added_outlined))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.snap['likes'].length} likes',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 5,
              ),
              caption(
                  caption: ' ${widget.snap["description"]}',
                  username: widget.snap["username"]),
              const SizedBox(
                height: 5,
              ),
              Text(
                'View all $commentLen comments',
                style: const TextStyle(fontSize: 16, color: Colors.black45),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateFormat.yMMMd()
                    .format(widget.snap['datePublished'].toDate()),
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row caption({required String caption, required String username}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                  text: username,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: caption,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ])),
        )
      ],
    );
  }
}
