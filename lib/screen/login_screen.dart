import 'package:flutter/material.dart';
import 'package:insta/resource/auth_method.dart';
import 'package:insta/screen/home_screen.dart';
import 'package:insta/screen/profile_screen.dart';
import 'package:insta/screen/signup_screen.dart';
import 'package:insta/utils/utils.dart';
import 'package:insta/widgets/instagram_logo.dart';
import 'package:insta/widgets/widgets.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const InstagramLogo(
              height: 55,
              width: 200,
            ),
            const SizedBox(height: 24),
            TextInputField(
                hintText: "Enter Your Email",
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            TextInputField(
              hintText: "Enter Your Password",
              textEditingController: _passwordController,
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: loginUser,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                    color: Color.fromRGBO(0, 149, 246, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  'Dont have an account?',
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    ' Signup.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      )),
    );
  }
}
