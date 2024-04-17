import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/controller/cubit/product_cubit/product_cubit.dart';
import '../../../utils/style/app_colors.dart';
import '../../widget/default_text.dart';
import '../electronics/electronics_builder/electronics_builder_list.dart';
import '../home/home_builder/products_builder.dart';
import '../jewelery/jewelery_builder/jewelery_list_builder.dart';
import '../men_clothing/men_clothing_builder/men_clothing_list_builder.dart';
import '../women_clothing/women_clothing_builder/women_clothing_builder_list.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late ProductCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    cubit = ProductCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppTheme.white,
            appBar: AppBar(
              backgroundColor: AppTheme.basieColor,
              elevation: 0.0,
              title: Center(
                child: DefaultText(
                  text: ''
                      '${cubit.favoritesProList.length + cubit.favoritesMenList.length + cubit.favoritesWomenList.length + cubit.favoritesJeweleryList.length + cubit.favoritesElectronicsList.length} Products in favorites',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: SingleChildScrollView(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return Column(children: [
                      cubit.favoritesProList.isEmpty &&
                              cubit.favoritesMenList.isEmpty &&
                              cubit.favoritesWomenList.isEmpty &&
                              cubit.favoritesJeweleryList.isEmpty &&
                              cubit.favoritesElectronicsList.isEmpty
                          ? Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/empty.svg',
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 65.h, left: 5.w),
                                  child: DefaultText(
                                    text: 'Oops, No thing here!',
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.textColor,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 700,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 2.h,
                                ),
                                itemCount: cubit.favoritesProList.length +
                                    cubit.favoritesMenList.length +
                                    cubit.favoritesWomenList.length +
                                    cubit.favoritesJeweleryList.length +
                                    cubit.favoritesElectronicsList.length,
                                // Add lengths of other lists
                                itemBuilder: (context, index) {
                                  if (index < cubit.favoritesProList.length) {
                                    // Display products
                                    return ProductsBuilder(
                                      productsModel:
                                          cubit.favoritesProList[index],
                                      onPressed: () {
                                        cubit.favoritesPro(
                                          cubit.favoritesProList[index],
                                        );
                                      },
                                      icon: cubit.favoritesProList.contains(
                                              cubit.favoritesProList[index])
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : const Icon(Icons.favorite_border),
                                    );
                                  } else if (index <
                                      cubit.favoritesProList.length +
                                          cubit.favoritesMenList.length) {
                                    // Display men's clothing
                                    final menIndex =
                                        index - cubit.favoritesProList.length;
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: MenClothingListBuilder(
                                        menClothingModel:
                                            cubit.favoritesMenList[menIndex],
                                        onPressed: () {
                                          cubit.favoritesMen(
                                            cubit.favoritesMenList[menIndex],
                                          );
                                        },
                                        icon: cubit.favoritesMenList.contains(
                                                cubit
                                                    .favoritesMenList[menIndex])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(Icons.favorite_border),
                                      ),
                                    );
                                  } else if (index <
                                      cubit.favoritesProList.length +
                                          cubit.favoritesMenList.length +
                                          cubit.favoritesWomenList.length) {
                                    final womenIndex = index -
                                        cubit.favoritesProList.length -
                                        cubit.favoritesMenList.length;
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: WomenClothingListBuilder(
                                        womenClothingModel: cubit
                                            .favoritesWomenList[womenIndex],
                                        onPressed: () {
                                          cubit.favoritesWomen(
                                            cubit
                                                .favoritesWomenList[womenIndex],
                                          );
                                        },
                                        icon: cubit.favoritesWomenList.contains(
                                                cubit.favoritesWomenList[
                                                    womenIndex])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(Icons.favorite_border),
                                      ),
                                    );
                                  } else if (index <
                                      cubit.favoritesProList.length +
                                          cubit.favoritesMenList.length +
                                          cubit.favoritesWomenList.length +
                                          cubit.favoritesJeweleryList.length) {
                                    final jeweleryIndex = index -
                                        cubit.favoritesProList.length -
                                        cubit.favoritesMenList.length -
                                        cubit.favoritesWomenList.length;
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: JeweleryListBuilder(
                                        jeweleryModel:
                                            cubit.favoritesJeweleryList[
                                                jeweleryIndex],
                                        onPressed: () {
                                          cubit.favoritesJewelery(
                                            cubit.favoritesJeweleryList[
                                                jeweleryIndex],
                                          );
                                        },
                                        icon: cubit.favoritesJeweleryList
                                                .contains(
                                                    cubit.favoritesJeweleryList[
                                                        jeweleryIndex])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(Icons.favorite_border),
                                      ),
                                    );
                                  } else if (index <
                                      cubit.favoritesProList.length +
                                          cubit.favoritesMenList.length +
                                          cubit.favoritesWomenList.length +
                                          cubit.favoritesJeweleryList.length +
                                          cubit.favoritesElectronicsList
                                              .length) {
                                    final electronicsIndex = index -
                                        cubit.favoritesProList.length -
                                        cubit.favoritesMenList.length -
                                        cubit.favoritesWomenList.length -
                                        cubit.favoritesJeweleryList.length;
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: ElectronicsListBuilder(
                                        electronicsModel:
                                            cubit.favoritesElectronicsList[
                                                electronicsIndex],
                                        onPressed: () {
                                          cubit.favoritesElectronics(
                                            cubit.favoritesElectronicsList[
                                                electronicsIndex],
                                          );
                                        },
                                        icon: cubit.favoritesElectronicsList
                                                .contains(cubit
                                                        .favoritesElectronicsList[
                                                    electronicsIndex])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(Icons.favorite_border),
                                      ),
                                    );
                                  }
                                  return null;
                                },
                              )),
                    ]);
                  },
                ),
              ),
            ));
      },
    );
  }
}
