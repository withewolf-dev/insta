import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayPicture extends StatelessWidget {
  const DisplayPicture({Key? key, required this.radius, this.photoUrl})
      : super(key: key);
  final double radius;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
            tileMode: TileMode.mirror,
          ),
          shape: BoxShape.circle),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: photoUrl != null
              ? NetworkImage(photoUrl!)
              : const NetworkImage(
                  'https://images.unsplash.com/photo-1659228794796-cdc230edb8f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
        ),
      ),
    );
  }
}
