import 'package:flutter/material.dart';

import '../widgets/custom_page_view.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageView(
        pageController: widget.pageController,
      ),
    );
  }
}
