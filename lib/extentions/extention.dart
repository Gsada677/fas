import 'package:flutter/material.dart';

extension SnackBarExtention on BuildContext{
  void showAppSnackBar({required String text,required Color color}){
    ScaffoldMessenger.of(this)
  }
}