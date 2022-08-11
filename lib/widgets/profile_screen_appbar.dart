import 'package:flutter/material.dart';

class ProfileScreenAppbar extends StatelessWidget with PreferredSizeWidget {
  const ProfileScreenAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
            Text(
              'Himsy02',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.black,
            )
          ],
        ));
  }
}
