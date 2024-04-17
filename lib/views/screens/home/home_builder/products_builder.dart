import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../model/product_model/product_model.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_text.dart';

class ProductsBuilder extends StatefulWidget {
  final ProductsModel productsModel;
  final void Function()? onPressed;
  final Widget icon;
  const ProductsBuilder(
      {super.key,
      required this.productsModel,
      required this.icon,
      required this.onPressed});

  @override
  State<ProductsBuilder> createState() => _ProductsBuilderState();
}

class _ProductsBuilderState extends State<ProductsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 35.w,
      decoration: BoxDecoration(
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
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.productsModel.image!),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text: widget.productsModel.category!,
              fontSize: 11.sp,
              color: AppTheme.textColor,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            ElevatedButton(
              onPressed: () {},
              child: DefaultText(
                text: '${widget.productsModel.rating!.count} Pieces',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: '\$${widget.productsModel.price!}',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textColor,
                ),
                IconButton(onPressed: widget.onPressed, icon: widget.icon),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
