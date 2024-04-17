import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../app_route/app_route.dart';
import '../../../../model/men_clothing_model/men_clothing_model.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_text.dart';

class MenClothingGridBuilder extends StatelessWidget {
  final MenClothingModel menClothingModel;
  final void Function()? onPressed;
  final Widget icon;
  const MenClothingGridBuilder(
      {super.key,
      required this.menClothingModel,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String apiText = menClothingModel.title!;
    String truncatedText =
        apiText.substring(0, 15); // Extract first 20 characters
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouters.menClothingDetailsPageRoute,
            arguments: menClothingModel);
      },
      child: Container(
        height: 42.h,
        width: 20.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.buttonColor),
          borderRadius: BorderRadius.circular(20),
          color: AppTheme.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 24.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.white,
                ),
                child: Hero(
                    tag: menClothingModel,
                    child: Image.network(menClothingModel.image!)),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              DefaultText(
                text: '$truncatedText....',
                maxLines: 10,
                fontSize: 11.sp,
                color: AppTheme.textColor,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    text: '\$${menClothingModel.price!}',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColor,
                  ),
                  IconButton(onPressed: onPressed, icon: icon),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
