import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/views/screens/women_clothing/women_clothing_builder/women_clothing_builder_list.dart';
import 'package:star_store/views/screens/women_clothing/women_clothing_builder/women_clothing_grid_builder.dart';
import '../../../controller/cubit/product_cubit/product_cubit.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/shimmer/shimmer_products_item.dart';
import '../../widget/default_text.dart';

class WomenClothingScreen extends StatefulWidget {
  const WomenClothingScreen({super.key});

  @override
  State<WomenClothingScreen> createState() => _WomenClothingScreenState();
}

class _WomenClothingScreenState extends State<WomenClothingScreen> {
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
                        text: 'Women Clothing',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabWomenToggleSwitch(),
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
                      return cubit.womenList.isNotEmpty
                          ? SizedBox(
                              height: 75.h,
                              child: tabWomenOnToggleShow(),
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

  tabWomenOnToggleShow() => cubit.tabWomenIndexBasicToggle.value == 0
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
                  itemCount: cubit.womenList.length,
                  itemBuilder: (context, index) {
                    return WomenClothingListBuilder(
                      womenClothingModel: cubit.womenList[index],
                      onPressed: () {
                        cubit.favoritesWomen(
                          cubit.womenList[index],
                        );
                      },
                      icon: cubit.favoritesWomenList
                              .contains(cubit.womenList[index])
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
      : cubit.tabWomenIndexBasicToggle.value == 1
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
                  itemCount: cubit.womenList.length,
                  itemBuilder: (context, index) {
                    return WomenClothingGridBuilder(
                      womenClothingModel: cubit.womenList[index],
                      onPressed: () {
                        cubit.favoritesWomen(
                          cubit.womenList[index],
                        );
                      },
                      icon: cubit.favoritesWomenList
                              .contains(cubit.womenList[index])
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
