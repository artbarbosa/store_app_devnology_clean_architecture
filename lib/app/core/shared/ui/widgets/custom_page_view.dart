import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: const [
        //HomeRouter(),
        Center(child: Text('Home')),
        Center(child: Text('Search')),
        Center(child: Text('Cart')),
        Center(child: Text('Profile')),
        Center(child: Text('More')),
      ],
    );
  }
}
