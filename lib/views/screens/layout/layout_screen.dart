import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/cubit/layout_cubit/layout_cubit.dart';
import '../../../utils/style/app_colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late LayoutCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = LayoutCubit.get(context);
    cubit.changeNavBar(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: cubit.screens[cubit.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppTheme.white,
            elevation: 0,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
            selectedItemColor: AppTheme.basieColor,
            selectedLabelStyle: const TextStyle(
              color: AppTheme.basieColor,
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
            selectedIconTheme: const IconThemeData(color: AppTheme.basieColor),
            unselectedItemColor: AppTheme.navNonSelectedColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Iconsax.home_14,
                ),
                activeIcon: const Icon(
                  Iconsax.home_25,
                ),
                tooltip: 'Home',
                label: cubit.labels[0],
              ),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                  activeIcon: const Icon(
                    Icons.favorite,
                  ),
                  tooltip: 'Favorite',
                  label: cubit.labels[1]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.shopping_cart,
                  ),
                  activeIcon: const Icon(
                    Iconsax.shopping_cart5,
                  ),
                  tooltip: 'Cart',
                  label: cubit.labels[2]),
            ],
          ),
        );
      },
    );
  }
}
