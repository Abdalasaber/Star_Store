import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import 'package:star_store/controller/cubit/product_cubit/product_cubit.dart';
import 'package:star_store/utils/shimmer/shimmer_products_builder.dart';
import 'package:star_store/views/screens/search/search_grid_builder.dart';
import '../../../utils/style/app_colors.dart';
import '../../widget/default_text.dart';
import '../../widget/default_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ProductCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    cubit = ProductCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

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
              padding: EdgeInsets.only(left: 20.w),
              child: DefaultText(
                text: 'Search Screen',
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.white,
              ))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 10.w, left: 10.w, bottom: 5.h),
                  child: DefaultTextField(
                    onChanged: (input) {
                      cubit.searchProduct(input: input);
                    },
                    hintText: 'Type something...',
                    controller: searchController,
                  ),
                ),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return cubit.proList.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: SizedBox(
                              height: 70.h,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 30,
                                  mainAxisExtent: 280,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.75,
                                ),
                                itemCount: cubit.searchProducts.isEmpty
                                    ? cubit.proList.length
                                    : cubit.searchProducts.length,
                                itemBuilder: (context, index) {
                                  return SearchGridBuilder(
                                    productsModel: cubit.searchProducts.isEmpty
                                        ? cubit.proList[index]
                                        : cubit.searchProducts[index],
                                    onPressed: () {
                                      cubit.favoritesPro(
                                        cubit.proList[index],
                                      );
                                    },
                                    icon: cubit.favoritesProList
                                            .contains(cubit.proList[index])
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
                        : const ShimmerProductsBuilder();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
