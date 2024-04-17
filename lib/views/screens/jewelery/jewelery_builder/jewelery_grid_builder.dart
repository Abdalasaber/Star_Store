import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../app_route/app_route.dart';
import '../../../../model/jewelery_model/jewelery_model.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_text.dart';

class JeweleryGridBuilder extends StatelessWidget {
  final JeweleryModel jeweleryModel;
  final void Function()? onPressed;
  final Widget icon;
  const JeweleryGridBuilder(
      {super.key,
      required this.jeweleryModel,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String apiText = jeweleryModel.title!;
    String truncatedText = apiText.substring(0, 20);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouters.jeweleryDescriptionPageRoute,
            arguments: jeweleryModel);
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
                    tag: jeweleryModel,
                    child: Image.network(jeweleryModel.image!)),
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultText(
                text: '$truncatedText....',
                maxLines: 10,
                fontSize: 11.sp,
                color: AppTheme.textColor,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    text: '\$${jeweleryModel.price!}',
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
