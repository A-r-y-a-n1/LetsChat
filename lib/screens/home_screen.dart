import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_chat/api/api.dart';
import 'package:lets_chat/models/chat_user.dart';
import 'package:lets_chat/screens/profile_screen.dart';
import '../widgets/chat_user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<ChatUser> _list = [];
  final List<ChatUser> _searchList = [];
  bool _isSearching = false;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, statusBarColor: Colors.white));
    APIs.getSelfInfo();
    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message.toString().contains('pause')) {
        APIs.updateActiveStatus(false);
      }
      if (message.toString().contains('resume')) {
        APIs.updateActiveStatus(true);
      }
      return Future.value(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          if (_isSearching) {
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: _isSearching
                ? TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Name, Email,....'),
                    autofocus: true,
                    style: const TextStyle(fontSize: 18, letterSpacing: 0.6),
                    onChanged: (val) {
                      _searchList.clear();
                      for (var i in _list) {
                        if (i.name.toLowerCase().contains(val.toLowerCase()) ||
                            i.email.toLowerCase().contains(val.toLowerCase())) {
                          _searchList.add(i);
                        }
                        setState(() {
                          _searchList;
                        });
                      }
                    },
                  )
                : const Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      "Let's Chat!!",
                      style: TextStyle(letterSpacing: 1.3),
                    ),
                  ),
            automaticallyImplyLeading: false,
            elevation: 3,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                  icon: Icon(_isSearching
                      ? CupertinoIcons.clear_circled
                      : Icons.search)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProfileScreen(
                                  user: APIs.me,
                                )));
                  },
                  icon: const Icon(Icons.person_sharp)),
              const SizedBox(width: 9)
            ],
          ),
          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () async {
          //     dialogs.showProgressBar(context);

          //     await APIs.auth.signOut().then((value) async {
          //       await GoogleSignIn().signOut().then((value) {
          //         //replacing home screen with login screen
          //         Navigator.pushReplacement(context,
          //             MaterialPageRoute(builder: (_) => const LoginScreen()));
          //       });
          //     });
          //   },
          //   backgroundColor: Colors.redAccent,
          //   // icon: const Icon(Icons.login_outlined),
          //   label: const Text(
          //     "Logout",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          body: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(
                options: const ParticleOptions(
                    baseColor: Colors.black,
                    spawnMaxSpeed: 40,
                    particleCount: 50,
                    maxOpacity: 0.9,
                    opacityChangeRate: 0.45,
                    spawnMinRadius: 4,
                    spawnMaxRadius: 5,
                    minOpacity: 0.8,
                    spawnMinSpeed: 10)),
            child: StreamBuilder(
              stream: APIs.getAllUsers(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    _list = data
                            ?.map((e) => ChatUser.fromJson(e.data()))
                            .toList() ??
                        [];

                    if (_list.isNotEmpty) {
                      return ListView.builder(
                          itemCount:
                              _isSearching ? _searchList.length : _list.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ChatUserCard(
                                user: _isSearching
                                    ? _searchList[index]
                                    : _list[index]);
                          });
                    } else {
                      return const Center(
                          child: Text(
                        "No Connections Found",
                        style: TextStyle(fontSize: 22),
                      ));
                    }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
