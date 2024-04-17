import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/model/product_model/product_model.dart';

import '../../../../app_route/app_route.dart';
import '../../../../utils/style/app_colors.dart';
import '../../widget/default_text.dart';

class SearchGridBuilder extends StatelessWidget {
  final ProductsModel productsModel;
  final void Function()? onPressed;
  final Widget icon;
  const SearchGridBuilder(
      {super.key,
      required this.productsModel,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String apiText = productsModel.title!;
    String truncatedText = apiText.substring(0, 15);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouters.homeDescriptionPageRoute,
            arguments: productsModel);
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
                    tag: productsModel,
                    child: Image.network(productsModel.image!)),
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
                    text: '\$${productsModel.price!}',
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
