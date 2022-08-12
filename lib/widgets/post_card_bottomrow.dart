import 'package:flutter/material.dart';
import 'package:insta/widgets/widgets.dart';
import 'package:intl/intl.dart';

class PostCardBottomRow extends StatelessWidget {
  final snap;
  const PostCardBottomRow({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FavoriteAnimatedIcon(),
                IconButton(
                  onPressed: () {},
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
                '${snap['likes'].length} likes',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 5,
              ),
              caption(caption: snap["description"], username: snap["username"]),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'View all 200 comments',
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateFormat.yMMMd().format(snap['datePublished'].toDate()),
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
