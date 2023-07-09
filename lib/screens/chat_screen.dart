import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/chat_user.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black87,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'images/no-content.png',
              ),
            ),
            const Text(
              "Messaging feature not supported yet !!!",
              textAlign: TextAlign.center,
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToLastDescent: true),
              textScaleFactor: 2,
            )
          ],
        ),
      ),
    );
  }
}
