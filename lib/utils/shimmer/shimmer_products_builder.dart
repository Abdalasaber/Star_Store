import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/utils/shimmer/shimmer_container_effect.dart';
import 'package:star_store/utils/shimmer/shimmer_icon_effect.dart';

import '../../utils/style/app_colors.dart';

class ShimmerProductsBuilder extends StatelessWidget {
  const ShimmerProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 35.w,
      //
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainerEffect(
              height: 24.h,
              width: 30.w,
            ),
            SizedBox(
              height: 1.h,
            ),
            ShimmerContainerEffect(
              height: 2.h,
              width: 7.w,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            ShimmerContainerEffect(
              height: 4.5.h,
              width: 11.w,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainerEffect(
                  height: 2.h,
                  width: 7.w,
                ),
                const ShimmerIconEffect(icon: Icons.favorite),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
