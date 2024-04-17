import 'package:flutter/material.dart';
import 'package:star_store/model/electronics_model/electronics_model.dart';
import 'package:star_store/model/men_clothing_model/men_clothing_model.dart';
import 'package:star_store/model/product_model/product_model.dart';
import 'package:star_store/views/screens/electronics/electronics_screen.dart';
import 'package:star_store/views/screens/home/home_description/home_description.dart';
import 'package:star_store/views/screens/women_clothing/women_clothing_description/women_clothing_description.dart';
import 'package:star_store/views/screens/men_clothing/men_clothing_screen.dart';

import '../model/jewelery_model/jewelery_model.dart';
import '../model/women_clothing_model/women_clothing_model.dart';
import '../views/screens/electronics/electronics_description/electronics_description.dart';
import '../views/screens/favorite/favorite_screen.dart';
import '../views/screens/home/home_screen.dart';
import '../views/screens/jewelery/jewelery_description/jewelery_description.dart';
import '../views/screens/jewelery/jewelery_screen.dart';
import '../views/screens/layout/layout_screen.dart';
import '../views/screens/men_clothing/men_clothing_description/men_clothing_description.dart';
import '../views/screens/on_boarding/on_boarding_screen.dart';
import '../views/screens/payment/payment_screen.dart';
import '../views/screens/search/search_screen.dart';
import '../views/screens/splash/splash_screen.dart';
import '../views/screens/women_clothing/women_clothing_screen.dart';
import 'app_route.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case (AppRouters.layoutPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      }

    case (AppRouters.splashPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      }
    case (AppRouters.onboardPageRoute):
      {
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      }

    case (AppRouters.homePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      }
    case (AppRouters.searchPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      }
      case (AppRouters.paymentPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const PaymentScreen());
      }
    case (AppRouters.menClothingPageRoute):
      {
        return MaterialPageRoute(
            builder: (context) => const MenClothingScreen());
      }
    case (AppRouters.womenClothingPageRoute):
      {
        return MaterialPageRoute(
            builder: (context) => const WomenClothingScreen());
      }
    case (AppRouters.electronicsPageRoute):
      {
        return MaterialPageRoute(
            builder: (context) => const ElectronicsScreen());
      }
    case (AppRouters.jeweleryScreenPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const JeweleryScreen());
      }
    case (AppRouters.favoritePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const FavoriteScreen());
      }

    case (AppRouters.homeDescriptionPageRoute):
      {
        final args = routeSettings.arguments as ProductsModel;
        return MaterialPageRoute(
            builder: (context) => HomeDescription(
                  productsModel: args,
                ));
      }
      case (AppRouters.menClothingDetailsPageRoute):
      {
        final args = routeSettings.arguments as MenClothingModel;
        return MaterialPageRoute(
            builder: (context) => MenClothingDescription(
                  menClothingModel: args,
                ));
      }

    case (AppRouters.womenClothingDetailsPageRoute):
      {
        final args = routeSettings.arguments as WomenClothingModel;
        return MaterialPageRoute(
            builder: (context) => WomenClothingDescriptionScreen(
                  womenClothingModel: args,
                ));
      }
      case (AppRouters.electronicsDescriptionPageRoute):
      {
        final args = routeSettings.arguments as ElectronicsModel;
        return MaterialPageRoute(
            builder: (context) => ElectronicsDescriptionScreen(
                  electronicsModel: args,
                ));
      }
      case (AppRouters.jeweleryDescriptionPageRoute):
      {
        final args = routeSettings.arguments as JeweleryModel;
        return MaterialPageRoute(
            builder: (context) => JeweleryDescriptionScreen(
                  jeweleryModel: args,
                ));
      }

    // case (AppRouters.detailsPageRoute):
    //   {
    //     final args = routeSettings.arguments as CategoriesModel;
    //     return MaterialPageRoute(
    //         builder: (context) => DetailsScreen(
    //               item: args,
    //             ));
    //   }

    default:
      return null;
  }
}
