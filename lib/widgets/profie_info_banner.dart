import 'package:flutter/material.dart';
import 'package:insta/model/user.dart' as model;
import 'package:insta/provider/user_provider.dart';
import 'package:insta/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileInforBanner extends StatelessWidget {
  final double width;
  const ProfileInforBanner({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          metaInfoRow(width, user.photoUrl),
          const SizedBox(
            height: 10,
          ),
          userBio(user: user),
          const SizedBox(
            height: 10,
          ),
          userFollowers(context),
        ],
      ),
    );
  }

  Row userFollowers(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 40,
          child: Stack(
            children: const <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1659788496199-01c0436a16f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=419&q=80'), // Provide your custom image
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1657299143544-f10ea56fbcd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 12,

                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1659735726409-f019111e4820?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'), // Provide your custom image
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 18.0),
            child: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: 'Followed by ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'evachen212,',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'saratan',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' and '),
                  TextSpan(
                      text: '48 others',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding userBio({required model.User user}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.username,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Editor',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.bio,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          )
        ],
      ),
    );
  }

  Row metaInfoRow(double width, String photoUrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DisplayPicture(
          radius: 35,
          photoUrl: photoUrl,
        ),
        SizedBox(
          width: width / 1.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              userMetaInfo(numbers: '3,334', title: 'Posts'),
              userMetaInfo(numbers: '196k', title: 'Followers'),
              userMetaInfo(numbers: '200', title: 'Following')
            ],
          ),
        )
      ],
    );
  }

  Column userMetaInfo({required String numbers, required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numbers,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12))
      ],
    );
  }
}
