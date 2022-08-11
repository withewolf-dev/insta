import 'package:flutter/material.dart';
import 'package:insta/resource/auth_method.dart';
import 'package:insta/screen/login_screen.dart';
import 'package:insta/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void logout(BuildContext context) async {
    await AuthMethods().signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: homeScreenAppbar(context: context),
        body: SafeArea(
            child: ListView(
          children: const [
            PostContainer(),
          ],
        )));
  }

  AppBar homeScreenAppbar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      centerTitle: true,
      title: const InstagramLogo(
        height: 35,
        width: 130,
      ),
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.camera_alt_outlined,
        color: Colors.black,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () => logout(context),
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
