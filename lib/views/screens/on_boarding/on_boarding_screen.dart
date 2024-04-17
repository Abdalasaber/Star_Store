import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/controller/cubit/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:star_store/model/on_boarding_model/on_boarding_model.dart';
import 'package:star_store/controller/local/enums.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app_route/app_route.dart';
import '../../../controller/local/shared_preferences.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../../utils/style/app_colors.dart';
import 'on_boarding_builder.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  final controller = PageController();

  finishOn(String screenName, BuildContext context) {
    MyCache.putBoolean(key: MyCacheKeys.onBoarding, value: cubit.isLast);
    Navigator.of(context).pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  late OnBoardingCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    cubit = OnBoardingCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.h),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 90.h,
            child: PageView.builder(
              onPageChanged: (index) {
                if (index == itemOnBoarding.length - 1) {
                  cubit.isTrue();
                } else {
                  cubit.isFalse();
                }
              },
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: itemOnBoarding.length,
              itemBuilder: (BuildContext context, int index) {
                return OnBoardingBuilder(
                  onBoardingModel: itemOnBoarding[index],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: itemOnBoarding.length,
            effect: const JumpingDotEffect(
              dotHeight: 16,
              dotWidth: 16,
              activeDotColor: AppTheme.basieColor,
              dotColor: Colors.black12,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              return cubit.isLast
                  ? DefaultElevatedButtonBlue(
                      onPressed: () {
                        finishOn(AppRouters.layoutPageRoute, context);
                      },
                      text: 'Get Started',
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(AppTheme.basieColor)),
                    )
                  : DefaultElevatedButtonBlue(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(microseconds: 1000000),
                            curve: Curves.easeInOut);
                      },
                      text: 'Next',
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(AppTheme.basieColor)),
                    );
            },
          ),
        ],
      ),
    );
  }
}
