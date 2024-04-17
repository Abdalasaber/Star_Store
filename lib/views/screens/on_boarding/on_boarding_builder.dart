import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../model/on_boarding_model/on_boarding_model.dart';
import '../../../utils/style/app_colors.dart';

class OnBoardingBuilder extends StatelessWidget {
  final OnBoarding onBoardingModel;
  const OnBoardingBuilder({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 00.0),
            child: SvgPicture.asset(
              onBoardingModel.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: onBoardingModel.text,
                      style: TextStyle(
                          color: AppTheme.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: onBoardingModel.textAnotherColor,
                        style: TextStyle(
                            color: AppTheme.blueLogo,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: onBoardingModel.textFirstColor,
                        style: TextStyle(
                            color: AppTheme.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
        ],
      ),
    );
  }
}
