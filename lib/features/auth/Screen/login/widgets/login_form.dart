import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
 import "package:t_stroy/utils/contents/sizes.dart";
 import 'package:t_stroy/utils/contents/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// حقل البريد الإلكتروني
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.tEmail,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// حقل كلمة المرور
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// تذكرني ونسيت كلمة المرور
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.tRememberMe),
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text(TTexts.tForgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// زر تسجيل الدخول
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: const Text(TTexts.tLogin)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// زر إنشاء حساب
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () {}, child: const Text(TTexts.tSignup)),
            ),
          ],
        ),
      ),
    );
  }
}