import 'package:flutter/material.dart';
import 'package:t_stroy/features/auth/Controller/Controllers_onBorading/controllers_onBorading.dart';
import 'package:t_stroy/utils/contents/sizes.dart';
import 'package:t_stroy/utils/device/device_utility.dart';

class SikpButton extends StatelessWidget {
  const SikpButton({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
