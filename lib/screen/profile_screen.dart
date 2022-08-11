import 'package:flutter/material.dart';
import 'package:insta/provider/user_procider.dart';
import 'package:insta/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: const ProfileScreenAppbar(),
        body: ListView(scrollDirection: Axis.vertical, children: [
          ProfileInforBanner(width: width),
          ProfileMediaGrid(width: width)
        ]));
  }
}