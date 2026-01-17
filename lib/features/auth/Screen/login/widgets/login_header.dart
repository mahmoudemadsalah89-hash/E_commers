import 'package:flutter/material.dart';
import 'package:t_stroy/utils/contents/image_strings.dart';
import 'package:t_stroy/utils/contents/text_strings.dart';
import 'package:t_stroy/utils/helpers/helper_functions.dart';


class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.tLogoImage : TImages.tLogoImage),
        ),
        Text(TTexts.tLoginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 20),
        Text(TTexts.tLoginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}