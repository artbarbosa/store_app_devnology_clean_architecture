import 'package:flutter/material.dart';

class CustomCardBanner extends StatelessWidget {
  const CustomCardBanner({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: SizedBox(
          width: 325,
          child: Image.asset('assets/banners/banner01.png'),
        ),
      ),
    );
  }
}
