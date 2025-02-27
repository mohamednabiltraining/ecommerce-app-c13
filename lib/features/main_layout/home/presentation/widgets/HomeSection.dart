import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_section_bar.dart';
import 'package:flutter/cupertino.dart';

typedef OnViewAllPressed = VoidCallback;

class Homesection extends StatelessWidget {
  String? sectionTitle;
  OnViewAllPressed? onViewAllPressed;
  Builder mainSectionBuilder;

  Homesection(
      {required this.mainSectionBuilder,
      this.sectionTitle,
      this.onViewAllPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sectionTitle != null
            ? CustomSectionBar(
                sectionNname: sectionTitle!,
                function: onViewAllPressed ?? () {},
              )
            : Container(),
        mainSectionBuilder
      ],
    );
  }
}
