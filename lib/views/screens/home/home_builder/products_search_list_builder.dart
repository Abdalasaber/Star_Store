import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/model/product_model/product_model.dart';

import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_text.dart';

class ProductsSearchListBuilder extends StatefulWidget {
  final ProductsModel productsModel;
  final void Function()? onPressed;
  final Widget icon;
  const ProductsSearchListBuilder(
      {super.key,
      required this.productsModel,
      required this.icon,
      required this.onPressed});

  @override
  State<ProductsSearchListBuilder> createState() =>
      _ProductsSearchListBuilderState();
}

class _ProductsSearchListBuilderState extends State<ProductsSearchListBuilder> {
  @override
  Widget build(BuildContext context) {
    String apiText = widget.productsModel.title!;
    String truncatedText = apiText.substring(0, 18);

    return InkWell(
      child: Container(
        height: 20.h,
        width: 90.w,
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
                    tag: widget.productsModel,
                    child: Image.network(widget.productsModel.image!)),
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
                          text: '${widget.productsModel.rating!.count!} Pieces',
                          fontSize: 9.sp,
                          color: AppTheme.textColor,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Row(
                          children: [
                            DefaultText(
                              text: '${widget.productsModel.rating!.rate!}',
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
                            text: '\$${widget.productsModel.price!}',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textColor,
                          ),
                          SizedBox(
                            width: 25.5.w,
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
