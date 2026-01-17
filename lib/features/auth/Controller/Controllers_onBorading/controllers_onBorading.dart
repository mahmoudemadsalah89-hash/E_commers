import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:t_stroy/features/auth/Screen/login/LoginScreen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // متغيرات لتتبع الصفحة الحالية والتحكم في PageView
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // تحديث المؤشر عند سحب الصفحة
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // الانتقال لصفحة محددة عند الضغط على النقاط
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // الانتقال للصفحة التالية أو لشاشة تسجيل الدخول
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // الانتقال لصفحة تسجيل الدخول (LoginScreen)
      Get.offAll(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // تخطي جميع الصفحات للذهاب لآخر صفحة أو شاشة الدخول
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
