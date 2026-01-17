import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_stroy/features/auth/Screen/widgets/onBoarding_Screen/onboarding_screen.dart';
import 'package:t_stroy/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stroy',
      themeMode: ThemeMode.system,
      theme: TAppTheme.LightTheme,
      darkTheme: TAppTheme.darkTheeme,
      home:OnboardingScreen()
    );
  }
}

