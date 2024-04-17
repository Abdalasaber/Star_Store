import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/categories_model/categories_model.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_text.dart';

class CategoriesBuilder extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoriesBuilder({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          focusColor: AppTheme.transparent,
          hoverColor: AppTheme.transparent,
          highlightColor: AppTheme.transparent,
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: categoriesModel.screen,
                    type: PageTransitionType.theme,
                    alignment: Alignment.bottomCenter,
                    duration: const Duration(seconds: 1)));
          },
          child: Container(
            height: 9.h,
            width: 15.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.categoryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                categoriesModel.icon,
                // ignore: deprecated_member_use
                color: AppTheme.basieColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        DefaultText(
          text: categoriesModel.text,
          color: AppTheme.textColor,
        ),
      ],
    );
  }
}
