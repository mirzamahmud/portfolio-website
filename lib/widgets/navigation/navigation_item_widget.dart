import 'package:flutter/material.dart';
import 'package:portfolio_website/models/home/home_navigation_model.dart';

class NavigationItemWidget extends StatelessWidget {
  final List<HomeNavigationModel> navList;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final String btnTxt;
  final TextStyle? textStyle;
  
  const NavigationItemWidget({required this.navList, required this.onPressed, this.buttonStyle, required this.btnTxt, this.textStyle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          btnTxt,
          style: textStyle,
        ),
      ),
    );
  }


}