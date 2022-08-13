import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/firebase_options.dart';
import 'package:insta/provider/user_provider.dart';
import 'package:insta/screen/add_post.dart';
import 'package:insta/screen/home_screen.dart';
import 'package:insta/screen/login_screen.dart';
import 'package:insta/screen/profile_screen.dart';
import 'package:insta/screen/search.dart';
import 'package:insta/screen/signup_screen.dart';
import 'package:insta/utils/utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const BottomNavigation();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const SignupScreen();
          },
        ),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  late String uid;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    LoginScreen(),
    Text(
      'Index 2: Business',
      style: optionStyle,
    ),
    ProfileScreen(
      uid: FirebaseAuth.instance.currentUser!.uid,
    )
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  void initState() {
    super.initState();
    addData();
  }

  void selectImage() async {
    try {
      Uint8List image = await pickImage(ImageSource.gallery);

      if (image != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => AddPost(
                    photo: image,
                    ctx: context,
                  )),
        );
      }
    } catch (err) {
      print("No Image Selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: selectImage,
                child: const Icon(
                  Icons.add_box_outlined,
                  size: 30,
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
