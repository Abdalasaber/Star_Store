import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../app_route/app_route.dart';
import '../../../../model/jewelery_model/jewelery_model.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_text.dart';

class JeweleryListBuilder extends StatefulWidget {
  final JeweleryModel jeweleryModel;
  final void Function()? onPressed;
  final Widget icon;
  const JeweleryListBuilder(
      {super.key,
      required this.jeweleryModel,
      required this.icon,
      required this.onPressed});

  @override
  State<JeweleryListBuilder> createState() => _JeweleryListBuilderState();
}

class _JeweleryListBuilderState extends State<JeweleryListBuilder> {
  @override
  Widget build(BuildContext context) {
    String apiText = widget.jeweleryModel.title!;
    String truncatedText = apiText.substring(0, 18);

    String apiPrice = widget.jeweleryModel.price!.toString();
    String truncatedPrice =
        apiPrice.length >= 5 ? apiPrice.substring(0, 4) : apiPrice;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouters.jeweleryDescriptionPageRoute,
            arguments: widget.jeweleryModel);
      },
      child: Container(
        height: 23.h,
        width: 35.w,
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
                child: Hero(
                    tag: widget.jeweleryModel,
                    child: Image.network(widget.jeweleryModel.image!)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: '$truncatedText....',
                      maxLines: 10,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          text: '${widget.jeweleryModel.rating!.count!} Pieces',
                          fontSize: 9.sp,
                          color: AppTheme.textColor,
                        ),
                        SizedBox(
                          width: 24.5.w,
                        ),
                        Row(
                          children: [
                            DefaultText(
                              text: '${widget.jeweleryModel.rating!.rate!}',
                              fontSize: 9.sp,
                              color: AppTheme.textColor,
                            ),
                            const Icon(
                              Icons.star,
                              color: AppTheme.amber,
                              size: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 3.5.h),
                    Expanded(
                      child: Row(
                        children: [
                          DefaultText(
                            text: '\$$truncatedPrice',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textColor,
                          ),
                          SizedBox(
                            width: 29.w,
                          ),
                          IconButton(
                              onPressed: widget.onPressed, icon: widget.icon),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
