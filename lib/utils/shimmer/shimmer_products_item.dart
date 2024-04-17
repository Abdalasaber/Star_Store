import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/utils/shimmer/shimmer_container_effect.dart';
import 'package:star_store/utils/shimmer/shimmer_icon_effect.dart';

import '../../utils/style/app_colors.dart';

class ShimmerProductsItem extends StatelessWidget {
  const ShimmerProductsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 95.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.buttonColor),
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24.h,
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ShimmerContainerEffect(
                height: 5.h,
                width: 10.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainerEffect(
                    height: 3.h,
                    width: 30.w,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainerEffect(
                        height: 2.h,
                        width: 15.w,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Row(
                        children: [
                          ShimmerContainerEffect(
                            height: 2.h,
                            width: 5.w,
                          ),
                          const ShimmerIconEffect(icon: Icons.star, size: 18),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    children: [
                      ShimmerContainerEffect(
                        height: 2.h,
                        width: 12.w,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      const ShimmerIconEffect(
                        icon: Icons.favorite,
                      ),
                    ],
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
