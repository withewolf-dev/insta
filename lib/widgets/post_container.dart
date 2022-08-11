import 'package:flutter/material.dart';
import 'package:insta/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        children: [
          cardTopRow(),
          const SizedBox(
            height: 10,
          ),
          const PostView(),
          bottomCardIcons(),
          caption()
        ],
      ),
    );
  }

  Padding cardTopRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              DisplayPicture(
                radius: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'himsy03',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const Icon(Icons.more_horiz)
        ],
      ),
    );
  }

  Row bottomCardIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            FavoriteAnimatedIcon(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.mode_comment_outlined),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.send_outlined),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.bookmark_added_outlined),
        )
      ],
    );
  }

  Padding caption() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
                overflow: TextOverflow.visible,
                text: const TextSpan(
                    text: 'himsy03 ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              ' I had the best time with my friendsI had the best time with my friendsI had the best time with my friendsI had the best time with my friendsI had the best time with my friendsI had the best time with my friends',
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ])),
          )
        ],
      ),
    );
  }
}
