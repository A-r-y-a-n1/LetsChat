import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_chat/api/api.dart';
import 'package:we_chat/helper/dialoges.dart';
import 'package:we_chat/models/chat_user.dart';

import '../main.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Screen"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            dialogs.showProgressBar(context);
            await APIs.auth.signOut().then((value) async {
              await GoogleSignIn().signOut().then((value) {
                //for hiding progress dialog
                Navigator.pop(context);

                //for moving to home screen
                Navigator.pop(context);

                //replacing home screen with login screen
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              });
            });
          },
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.login_outlined),
          label: const Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
          child: Column(
            children: [
              SizedBox(
                width: mq.width,
                height: mq.height * .04,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(mq.height * .15),
                    child: CachedNetworkImage(
                      height: mq.height * .3,
                      width: mq.width * .3,
                      fit: BoxFit.fill,
                      imageUrl: widget.user.image,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const CircleAvatar(
                          child: Icon(CupertinoIcons.person)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black87,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: mq.height * .025,
              ),
              Text(
                widget.user.email,
                style: const TextStyle(color: Colors.black87, fontSize: 16),
              ),
              SizedBox(
                height: mq.height * .05,
              ),
              TextFormField(
                initialValue: widget.user.name,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "e.g. Aryan Rohela",
                    label: const Text("Name")),
              ),
              SizedBox(
                height: mq.height * .05,
              ),
              TextFormField(
                initialValue: widget.user.about,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.info_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: " e.g. Feeling Happy",
                    label: const Text("Name")),
              ),
              SizedBox(
                height: mq.height * .05,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: Size(mq.width * .5, mq.height * .058)),
                onPressed: () {},
                icon: const Icon(Icons.update_outlined),
                label: const Text(
                  "UPDATE",
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ));
  }
}
