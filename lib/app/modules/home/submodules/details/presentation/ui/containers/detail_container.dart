import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../_design_system/colors/app_colors_const.dart';
import '../../../../../../../_design_system/widgets/appbar/custom_app_bar_widget.dart';
import '../../../../../../../_design_system/widgets/buttons/custom_primary_button_widget.dart';
import '../../../../../../../_design_system/widgets/buttons/custom_secondary_buton_widget.dart';
import '../../../../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../../routers/detail_arguments.dart';
import '../controllers/detail_controller.dart';
import '../pages/detail_page.dart';

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final DetailArguments arguments;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  final DetailController controller = GetIt.I.get<DetailController>();
  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBarWidget(
          isActiveCart: true,
          automaticallyImplyLeading: true,
        ),
      ),
      body: DetailPage(product: widget.arguments.product),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 86,
          color: ColorsConst.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSecondaryButtonWidget(
                  onPressed: () {},
                  titleButton: 'SHARE THIS',
                ),
                CustomPrimaryButtonWidget(
                  onPressed: () {
                    controller.addProductToCart(widget.arguments.product);
                    controllerBottomNavigation.changePage(2);
                    Navigator.of(context).pop();
                  },
                  titleButton: 'ADD TO CART',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
