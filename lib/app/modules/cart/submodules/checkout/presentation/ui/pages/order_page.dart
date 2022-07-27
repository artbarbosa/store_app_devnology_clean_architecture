import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app_devnology/app/_design_system/text_styles/text_styles_const.dart';
import 'package:store_app_devnology/app/_design_system/widgets/appbar/custom_app_bar_widget.dart';
import 'package:store_app_devnology/app/_design_system/widgets/buttons/custom_primary_button_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBarWidget(
          isLeading: true,
          isActiveActionsBar: true,
          numberItemsInCart: 2,
        ),
      ),
      body: SizedBox(
        width: currentSize.width,
        height: currentSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              width: currentSize.width * 0.6,
              child: SvgPicture.asset(
                'assets/icons/order_icon_center.svg',
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Order Placed!',
              style: TextStylesConst.titleHome,
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40.0, right: 40.0, top: 16.0),
              child: Text(
                'Your order was placed successfully. For more details, check All My Orders page under Profile tab',
                style: TextStylesConst.descriptionProductDetail,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            CustomPrimaryButtonWidget(
              titleButton: 'MY ORDERS',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
