import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("We Chat"),
        leading:const Icon(CupertinoIcons.home),
        actions: [
          IconButton(onPressed: (){} , icon: Icon(Icons.search)),
          IconButton(onPressed: (){} , icon: Icon(Icons.more_vert))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add_comment_rounded)),
    );
  }
}
