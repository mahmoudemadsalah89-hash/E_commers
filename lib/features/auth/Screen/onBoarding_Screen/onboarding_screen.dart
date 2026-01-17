import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_stroy/features/auth/Controller/Controllers_onBorading/controllers_onBorading.dart'
    show OnboardingController;
import 'package:t_stroy/features/auth/Screen/onBoarding_Screen/widgets/NextButton.dart';
import 'package:t_stroy/features/auth/Screen/onBoarding_Screen/widgets/SikpButton.dart';
import 'package:t_stroy/features/auth/Screen/onBoarding_Screen/widgets/Onboarding%20Page.dart';
import 'package:t_stroy/features/auth/Screen/onBoarding_Screen/widgets/smoothpageIndicator.dart';
import 'package:t_stroy/utils/contents/colors.dart';
import 'package:t_stroy/utils/contents/sizes.dart';
import 'package:t_stroy/utils/device/device_utility.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف المتحكم باستخدام Get.put لإنشاء نسخة منه
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          // 1. الصفحات القابلة للسحب
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnboardingPage(
                image: "assets/images/0n_boarding_images/on-boarding-image-1.png",
                title: "Create your own stroy",
                subTitle: "Create your own stroy and share it with the word",
              ),
              OnboardingPage(
                image: "assets\images\on_boarding_images\on-boarding-image-2.png",
                title: "Tell your story",
                subTitle: "Tell your story and share it with the word",
              ),
              OnboardingPage(
                image: "assets\images\on_boarding_images\on-boarding-image-3.png",
                 title: "Get inspired",
                subTitle: "Get Inspired by other stories and share your own"
              ),
            ],
          ),

          // 2. زر التخطي (Skip) في الأعلى
          SikpButton(controller: controller),

          // 3. مؤشر النقاط (Dot Navigation) في الأسفل
          smoothpageindicator(controller: controller),

          // 4. زر الانتقال التالي (Next Button) الدائري
          NextButton(controller: controller),
        ],
      ),
    );
  }
}
