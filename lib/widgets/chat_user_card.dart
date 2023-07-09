import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/screens/chat_screen.dart';

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
        margin: EdgeInsets.symmetric(horizontal: mq.width * 0.04, vertical: 8),
        color: Colors.white24,
        elevation: 1,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatScreen(
                          user: widget.user,
                        )));
          },
          child: ListTile(
            // leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(mq.width * .1),
              child: CachedNetworkImage(
                height: mq.height * .1,
                width: mq.width * .15,
                fit: BoxFit.fill,
                imageUrl: widget.user.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const CircleAvatar(child: Icon(CupertinoIcons.person)),
              ),
            ),
            title: Text(widget.user.name),
            subtitle: Text(
              widget.user.about,
              maxLines: 1,
            ),
            trailing: const Text(
              "12:00 PM",
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ));
  }
}
