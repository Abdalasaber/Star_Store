import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_store/controller/cubit/on_boarding_cubit/on_boarding_cubit.dart';
import '../../../controller/cubit/product_cubit/product_cubit.dart';
import 'app_route/app_route.dart';
import 'app_route/app_router.dart';
import 'controller/cubit/layout_cubit/layout_cubit.dart';
import 'controller/local/shared_preferences.dart';
import 'controller/remote_db/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await MyCache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => OnBoardingCubit()),
            BlocProvider(create: (context) => LayoutCubit()),
            BlocProvider(
                create: (context) => ProductCubit()
                  ..getAllProduct()
                  ..getMenProducts()
                  ..getWomenProducts()
                  ..getElectronicsProducts()
                  ..getJeweleryProducts()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Star Store',
            initialRoute: AppRouters.splashPageRoute,
            onGenerateRoute: onGenerateRoute,
            theme: ThemeData(
              fontFamily: 'Montserrat',
            ),
          ),
        );
      },
    );
  }
}
