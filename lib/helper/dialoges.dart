import 'package:flutter/material.dart';

// ignore: camel_case_types
class dialogs {
  static void showSnackbar(String context, String msg) {
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue.withOpacity(.7),
      behavior: SnackBarBehavior.floating,
    ));
  }
  static void showProgressBar(BuildContext context){
    showDialog(context: context, builder: (_) => const Center(child: CircularProgressIndicator()));
  }
}
