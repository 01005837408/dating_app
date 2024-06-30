import 'package:flutter/material.dart';

class Dialogs{
  static  showSnakBar(context , String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
      backgroundColor: Colors.blue,
    )
    );
  }
  static  showProgressBar(context ){
    showDialog(context: (context),
        builder: (context) => const Center(child: CircularProgressIndicator()));
  }

}