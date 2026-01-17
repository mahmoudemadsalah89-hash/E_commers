import 'package:flutter/material.dart';
import 'package:t_stroy/features/auth/Controller/Controllers_onBorading/controllers_onBorading.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 24,
      child: ElevatedButton(
        onPressed: () => controller.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
        ),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
