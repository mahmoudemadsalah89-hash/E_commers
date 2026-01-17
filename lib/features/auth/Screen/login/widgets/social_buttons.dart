import 'package:flutter/material.dart';
import 'package:t_stroy/utils/contents/colors.dart';
import 'package:t_stroy/utils/contents/image_strings.dart';
import "package:t_stroy/utils/contents/sizes.dart";


class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(width: TSizes.iconMd, height: TSizes.iconMd, image: AssetImage(TImages.tGoogleLogo)),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(width: TSizes.iconMd, height: TSizes.iconMd, image: AssetImage(TImages.tFacebookLogo)),
          ),
        ),
      ],
    );
  }
}