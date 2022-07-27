import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../../../../_design_system/colors/app_colors_const.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = GetIt.I.get<SplashController>();
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      controller.animatedSize = 0.13;
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacementNamed('/', arguments: pageController);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsConst.primary,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: size * 0.8,
              height: size * 0.1,
              child: Center(
                child: SvgPicture.asset(
                  'assets/logo/name_devnology.svg',
                ),
              ),
            ),
            SizedBox(
              width: size * 0.8,
              height: size * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    width: size * controller.animatedSize,
                    height: size * 0.1,
                    color: ColorsConst.primary,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/logo/left_arrow.png',
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    width: size * controller.animatedSize,
                    height: size * 0.1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    color: ColorsConst.primary,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/logo/right_arrow.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
