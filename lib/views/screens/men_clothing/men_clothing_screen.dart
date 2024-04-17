import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/cubit/product_cubit/product_cubit.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/shimmer/shimmer_products_item.dart';
import '../../widget/default_text.dart';
import 'men_clothing_builder/men_clothing_grid_builder.dart';
import 'men_clothing_builder/men_clothing_list_builder.dart';

class MenClothingScreen extends StatefulWidget {
  const MenClothingScreen({super.key});

  @override
  State<MenClothingScreen> createState() => _MenClothingScreenState();
}

class _MenClothingScreenState extends State<MenClothingScreen> {
  late ProductCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
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
                        text: 'Men Clothing',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabMenToggleSwitch(),
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
                      return cubit.menList.isNotEmpty
                          ? SizedBox(
                              height: 75.h,
                              child: tabMenOnToggleShow(),
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

  tabMenOnToggleShow() => cubit.tabMenIndexBasicToggle.value == 0
      ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return SizedBox(
                height: 24.h,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 3.w,
                  ),
                  itemCount: cubit.menList.length,
                  itemBuilder: (context, index) {
                    return MenClothingListBuilder(
                      menClothingModel: cubit.menList[index],
                      onPressed: () {
                        cubit.favoritesMen(
                          cubit.menList[index],
                        );
                      },
                      icon:
                          cubit.favoritesMenList.contains(cubit.menList[index])
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
      : cubit.tabMenIndexBasicToggle.value == 1
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SizedBox(
                height: 88.h,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // count
                    mainAxisSpacing: 30, // right left
                    mainAxisExtent: 280, // width horizontal
                    crossAxisSpacing: 10, // up down
                    childAspectRatio: 0.75,
                  ),
                  itemCount: cubit.menList.length,
                  itemBuilder: (context, index) {
                    return MenClothingGridBuilder(
                      menClothingModel: cubit.menList[index],
                      onPressed: () {
                        cubit.favoritesMen(
                          cubit.menList[index],
                        );
                      },
                      icon:
                          cubit.favoritesMenList.contains(cubit.menList[index])
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border),
                    );
                  },
                ),
              ),
            )
          : DefaultText(text: 'text');
}
