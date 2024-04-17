import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/banner_model/banner_model.dart';
import '../../../../utils/style/app_colors.dart';

class BannerBuilder extends StatelessWidget {
  final BannerModel bannerModel;
  const BannerBuilder({super.key, required this.bannerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      height: 25.h,
      width: 80.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.contColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            bannerModel.image,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
