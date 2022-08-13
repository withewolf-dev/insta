import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta/model/user.dart';
import 'package:insta/provider/user_provider.dart';
import 'package:insta/resource/auth_method.dart';
import 'package:insta/screen/login_screen.dart';
import 'package:insta/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
    final User? user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: homeScreenAppbar(context: context),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy('datePublished', descending: true)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (ctx, index) => PostContainer(
                      snap: snapshot.data!.docs[index].data(),
                    ));
          },
        ),
      ),
    );
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
