import 'package:flutter/material.dart';
import 'package:insta/screen/profile_screen.dart';
import 'package:insta/widgets/display_picture.dart';

class PostCardTopRow extends StatelessWidget {
  final String displayPicture;
  final String username;
  final String uid;
  const PostCardTopRow(
      {Key? key,
      required this.displayPicture,
      required this.username,
      required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(uid: uid),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DisplayPicture(
                  radius: 20,
                  photoUrl: displayPicture,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    username,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
