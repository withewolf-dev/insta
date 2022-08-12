import 'package:flutter/material.dart';
import 'package:insta/model/user.dart';
import 'package:insta/resource/firestore_method.dart';

class FavoriteAnimatedIcon extends StatefulWidget {
  final User user;
  final snap;
  const FavoriteAnimatedIcon({Key? key, required this.snap, required this.user})
      : super(key: key);

  @override
  State<FavoriteAnimatedIcon> createState() => _FavoriteAnimatedIconState();
}

class _FavoriteAnimatedIconState extends State<FavoriteAnimatedIcon>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;

  void isliked() async {
    await FireStoreMethods()
        .likePost(widget.snap['postId'], widget.user.uid, widget.snap['likes']);
    if (_isLiked) {
      _isLiked = false;
    } else {
      _isLiked = true;
    }
  }

  onTapUp(TapUpDetails details) {
    isliked();
    _animationController.reverse();
  }

  onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  onTapCancel() {
    _animationController.reverse();
  }

  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1.2 + _animationController.value;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        child: Transform.scale(
            scale: scale,
            child: _isLiked
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_outline_outlined)),
      ),
    );
  }
}
