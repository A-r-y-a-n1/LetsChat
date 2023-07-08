import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/chat_user.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: mq.width * 0.04, vertical: 3),
        color: Colors.cyanAccent.shade200,
        elevation: 1,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {},
          child: const ListTile(
            leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
            title: Text('widget.user.name'),
            subtitle: Text(
              'widget.user.about',
              maxLines: 1,
            ),
            trailing: Text(
              "12:00 PM",
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ));
  }
}