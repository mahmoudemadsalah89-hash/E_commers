import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image, title, subTitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0), // مسافة الحواف
      child: Column(
        children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.8, // 80% من عرض الشاشة
            height:
                MediaQuery.of(context).size.height *
                0.6, // 60% من ارتفاع الشاشة
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
