import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/cubit/product_cubit/product_cubit.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/shimmer/shimmer_products_item.dart';
import '../../widget/default_text.dart';
import 'jewelery_builder/jewelery_grid_builder.dart';
import 'jewelery_builder/jewelery_list_builder.dart';

class JeweleryScreen extends StatefulWidget {
  const JeweleryScreen({super.key});

  @override
  State<JeweleryScreen> createState() => _JeweleryScreenState();
}

class _JeweleryScreenState extends State<JeweleryScreen> {
  late ProductCubit cubit;

  @override
  void initState() {
    cubit = ProductCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
          backgroundColor: AppTheme.basieColor,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: AppTheme.white,
            ),
          ),
          title: Padding(
              padding: EdgeInsets.only(left: 23.5.w),
              child: DefaultText(
                text: 'Star Store',
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.white,
              ))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        child: SingleChildScrollView(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: 'Jewelery Product',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabJeweleryToggleSwitch(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      return cubit.jeweleryList.isNotEmpty
                          ? SizedBox(
                              height: 75.h,
                              child: tabJeweleryOnToggleShow(),
                            )
                          : SizedBox(
                              height: 20.h, child: const ShimmerProductsItem());
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  tabJeweleryOnToggleShow() => cubit.tabJeweleryIndexBasicToggle.value == 0
      ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return SizedBox(
                height: 200.h,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 3.w,
                  ),
                  itemCount: cubit.jeweleryList.length,
                  itemBuilder: (context, index) {
                    return JeweleryListBuilder(
                      jeweleryModel: cubit.jeweleryList[index],
                      onPressed: () {
                        cubit.favoritesJewelery(
                          cubit.jeweleryList[index],
                        );
                      },
                      icon: cubit.favoritesJeweleryList
                              .contains(cubit.jeweleryList[index])
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border),
                    );
                  },
                ),
              );
            },
          ),
        )
      : cubit.tabJeweleryIndexBasicToggle.value == 1
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SizedBox(
                height: 88.h,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 280,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: cubit.jeweleryList.length,
                  itemBuilder: (context, index) {
                    return JeweleryGridBuilder(
                      jeweleryModel: cubit.jeweleryList[index],
                      onPressed: () {
                        cubit.favoritesJewelery(
                          cubit.jeweleryList[index],
                        );
                      },
                      icon: cubit.favoritesJeweleryList
                              .contains(cubit.jeweleryList[index])
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border),
                    );
                  },
                ),
              ),

              // UsGeneralGridBuilder(),
            )
          : DefaultText(text: 'text');
}
