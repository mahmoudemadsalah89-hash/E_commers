import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_stroy/commo/Styles/spacing_styles.dart';
import 'package:t_stroy/features/auth/Screen/login/widgets/form_divider.dart';
import 'package:t_stroy/features/auth/Screen/login/widgets/login_form.dart';
import 'package:t_stroy/features/auth/Screen/login/widgets/login_header.dart';
import 'package:t_stroy/features/auth/Screen/login/widgets/social_buttons.dart';
import 'package:t_stroy/utils/contents/text_strings.dart';
import 'package:t_stroy/utils/contents/sizes.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight, // بادئ مخصص للارتفاع
          child: Column(
            children: [
              /// 1. الشعار والعناوين
              const TLoginHeader(),

              /// 2. نموذج الحقول والأزرار
              const TLoginForm(),

              /// 3. الفاصل الاجتماعي (Divider)
              TFormDivider(dividerText: TTexts.tOR.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// 4. أزرار التواصل الاجتماعي (Footer)
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}