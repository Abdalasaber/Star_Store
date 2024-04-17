import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'package:sizer/sizer.dart';
import 'package:star_store/model/categories_model/categories_model.dart';
import 'package:star_store/utils/style/app_colors.dart';
import '../../../controller/cubit/product_cubit/product_cubit.dart';
import '../../../model/banner_model/banner_model.dart';
import '../../../utils/shimmer/shimmer_products_builder.dart';
import '../../widget/default_text.dart';
import '../../widget/default_text_field.dart';
import '../search/search_screen.dart';
import 'home_builder/banner_builder.dart';
import 'home_builder/categories_builder.dart';
import 'home_builder/products_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Center(
          child: DefaultText(
            text: 'Welcome in Star Store',
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 3.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 10.w, left: 10.w, bottom: 5.h),
                  child: DefaultTextField(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const SearchScreen(),
                              type: PageTransitionType.fade,
                              alignment: Alignment.bottomCenter,
                              duration: const Duration(seconds: 1)));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SizedBox(
                    height: 45.h,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemBannerModel.length,
                      itemBuilder: (context, index) {
                        return BannerBuilder(
                          bannerModel: itemBannerModel[index],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    height: 17.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                      itemCount: itemCategoriesModel.length,
                      itemBuilder: (context, index) {
                        return CategoriesBuilder(
                          categoriesModel: itemCategoriesModel[index],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 75.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: AppTheme.contColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              DefaultText(
                                text: 'All Products',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textColor,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppTheme.basieColor),
                                    fixedSize: MaterialStateProperty.all(Size(
                                      26.w,
                                      6.h,
                                    ))),
                                child: DefaultText(
                                  text: 'View all',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: BlocBuilder<ProductCubit, ProductState>(
                            builder: (context, state) {
                              return cubit.proList.isNotEmpty
                                  ? SizedBox(
                                      height: 47.h,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: 3.w,
                                        ),
                                        itemCount: cubit.proList.length,
                                        itemBuilder: (context, index) {
                                          return ProductsBuilder(
                                            productsModel: cubit.proList[index],
                                            onPressed: () {
                                              cubit.favoritesPro(
                                                cubit.proList[index],
                                              );
                                            },
                                            icon: cubit.favoritesProList
                                                    .contains(
                                                        cubit.proList[index])
                                                ? const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  )
                                                : const Icon(
                                                    Icons.favorite_border),
                                          );
                                        },
                                      ),
                                    )
                                  : const ShimmerProductsBuilder();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
