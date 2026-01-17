import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_stroy/features/auth/Controller/Controllers_onBorading/controllers_onBorading.dart';
import 'package:t_stroy/utils/contents/colors.dart';
import 'package:t_stroy/utils/contents/sizes.dart';
import 'package:t_stroy/utils/device/device_utility.dart';
import 'package:t_stroy/utils/helpers/helper_functions.dart';

class smoothpageindicator extends StatelessWidget {
  const smoothpageindicator({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.dark : TColors.lightBackground,
          dotHeight: 3,
        ),
      ),
    );
  }
}
