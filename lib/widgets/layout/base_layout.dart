import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/layout/layout_constant.dart';

class BaseLayout extends StatelessWidget {
  final Widget? mobileLayout;
  final Widget? tabletLayout;
  final Widget? webLayout;

  const BaseLayout({
    this.mobileLayout,
    this.tabletLayout,
    this.webLayout,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if((constraints.minWidth > mobileMinWidth) && (constraints.maxWidth < mobileMaxWidth)){
          return mobileLayout!;
        } else if((constraints.minWidth > tabletMinWidth) && (constraints.maxWidth < tabletMaxWidth)){
          return tabletLayout!;
        } else{
          return webLayout!;
        }
      },
    );
  }
}