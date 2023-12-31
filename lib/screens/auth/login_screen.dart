import 'package:flutter/material.dart';
import 'package:we_chat/screens/home_screen.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500) , () {
      setState(() {
        _isAnimate = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Welcome to We Chat")),
      body: Stack(
        children: [
          //app logo
          AnimatedPositioned(
              top: _isAnimate ? mq.height * .13 : -mq.height * .13,
              right:mq.width * .25,
              width: mq.width * .5,
              duration: const Duration(milliseconds: 500),
              child: Image.asset('images/chat.png')),
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .03,
            // right: mq.width * .15,
            width: mq.width * .95,
            height: mq.height * .08,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen.shade300,
                  shape: const StadiumBorder(),
                  elevation: 1.0),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              icon: Image.asset('images/google.png', width: mq.width * .1),
              label: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: [
                      TextSpan(text: 'Log in with '),
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
