import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utilis/constants/app_colors.dart';
import '../../../utilis/constants/app_sizes.dart';
import '../../../utilis/constants/enums.dart';
import 'brand_title_text.dart';

class BrandTitleTextVerfied extends StatelessWidget {
  const BrandTitleTextVerfied({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AppColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: brandTextSize,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: AppSizes.iconXs),
      ],
    );
  }
}
