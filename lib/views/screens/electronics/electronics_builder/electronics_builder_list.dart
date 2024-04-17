import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/model/electronics_model/electronics_model.dart';

import '../../../../app_route/app_route.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_text.dart';

class ElectronicsListBuilder extends StatefulWidget {
  final ElectronicsModel electronicsModel;
  final void Function()? onPressed;
  final Widget icon;
  const ElectronicsListBuilder(
      {super.key,
      required this.electronicsModel,
      required this.icon,
      required this.onPressed});

  @override
  State<ElectronicsListBuilder> createState() => _ElectronicsListBuilderState();
}

class _ElectronicsListBuilderState extends State<ElectronicsListBuilder> {
  @override
  Widget build(BuildContext context) {
    String apiText = widget.electronicsModel.title!;
    String truncatedText = apiText.substring(0, 18);
    String apiPrice = widget.electronicsModel.price!.toString();
    String truncatedPrice =
        apiPrice.length >= 5 ? apiPrice.substring(0, 4) : apiPrice;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouters.electronicsDescriptionPageRoute,
            arguments: widget.electronicsModel);
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
                    tag: widget.electronicsModel,
                    child: Image.network(widget.electronicsModel.image!)),
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
                          text:
                              '${widget.electronicsModel.rating!.count!} Pieces',
                          fontSize: 9.sp,
                          color: AppTheme.textColor,
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Row(
                          children: [
                            DefaultText(
                              text: '${widget.electronicsModel.rating!.rate!}',
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
