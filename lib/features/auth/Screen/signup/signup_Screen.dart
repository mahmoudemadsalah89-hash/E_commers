import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_stroy/features/auth/Screen/login/widgets/form_divider.dart';
import 'package:t_stroy/features/auth/Screen/login/widgets/social_buttons.dart';
import 'package:t_stroy/features/auth/Screen/signup/widgets/Terms%20and%20Conditions.dart';
import 'package:t_stroy/utils/contents/colors.dart';
import 'package:t_stroy/utils/contents/sizes.dart';
import 'package:t_stroy/utils/contents/text_strings.dart';
import 'package:t_stroy/utils/helpers/helper_functions.dart';
import 'package:t_stroy/utils/theme/custom/text_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: TSizes.defaultSpace,
            vertical: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  //Titel
                  Text(
                    TTexts.tSignUpTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  //From
                  Form(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "First Name",
                                  prefixIcon: Icon(Iconsax.user),
                                ),
                              ),
                            ),
                            const SizedBox(width: TSizes.spaceBtwInputFields),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Last Name",
                                  prefixIcon: Icon(Iconsax.user),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        //UserName
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "UserName",
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                        SizedBox(height: 25.0),

                        /// حقل البريد الإلكتروني
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: TTexts.tEmail,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "phone",
                            prefixIcon: Icon(Iconsax.eye1),
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
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  //Teams&Condition
                  TTermsAndConditionCheckbox(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "CreateAccount",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              TFormDivider(dividerText: TTexts.tOR.capitalize!),
              //SocailButton
              SizedBox(height: TSizes.spaceBtwSections),
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
