import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/controller/cubit/product_cubit/product_cubit.dart';
import 'package:star_store/model/men_clothing_model/men_clothing_model.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../widget/default_elevated_button_blue.dart';
import '../../../widget/default_text.dart';

class MenClothingDescription extends StatefulWidget {
  final MenClothingModel menClothingModel;

  const MenClothingDescription({Key? key, required this.menClothingModel})
      : super(key: key);

  @override
  State<MenClothingDescription> createState() => JopDetailsScreen();
}

class JopDetailsScreen extends State<MenClothingDescription> {
  late ProductCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    cubit = ProductCubit.get(context);
    super.initState();
  }

  void addToCart() {
    // Only add to cart if something is in the cart
    if (cubit.quantityCount > 0) {
      // Add to cart
      cubit.addToCart(
        menItem: widget.menClothingModel!,
        quantity: cubit.quantityCount,
      );

      // Show success dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: DefaultText(
            text: 'Item added successfully',
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Pop to remove dialog box
                Navigator.pop(context);

                // Reset quantity count to 0
                cubit.resetQuantityCount();
              },
              icon: const Icon(Icons.done),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppTheme.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: 450,
                          width: 550,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.black12),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                          ),
                          child: Hero(
                              tag: widget.menClothingModel,
                              child: Image.network(
                                  "${widget.menClothingModel.image}")),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 54.5.h, right: 1.w, left: 1.w),
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.w),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppTheme.black12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_circle_left_outlined)),
                              ),
                            ),
                          ),
                        ),
                      ]),
                  Container(
                      height: 55.5.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text:
                                    widget.menClothingModel.category ?? " null",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textColor,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              DefaultText(
                                text: widget.menClothingModel.title ?? " null",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DefaultText(
                                    text:
                                        '\$${widget.menClothingModel.price ?? " null"}',
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  BlocBuilder<ProductCubit, ProductState>(
                                    builder: (context, state) {
                                      return Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                cubit.decrementMenProduct();
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 25,
                                              )),
                                          DefaultText(
                                            text: '${cubit.quantityCount}',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                cubit.incrementMenProduct();
                                              },
                                              icon: const Icon(Icons.add,
                                                  size: 25)),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              DefaultText(
                                text: widget.menClothingModel.description ??
                                    " null",
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textColor,
                              ),
                            ]),
                      )),
                ],
              ),
            ),
            floatingActionButton: DefaultElevatedButtonBlue(
              onPressed: () {
                addToCart();
              },
              text: 'Add to cart',
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.basieColor)),
            ));
      },
    );
  }
}
