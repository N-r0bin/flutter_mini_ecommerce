import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/app_appbar.dart';
import '../../../common/widgets/curved_edges_widget.dart';
import '../../../common/widgets/icon/circular_icon.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: 300,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Center(
                  child: imageUrl.startsWith('http')
                      ? Image.network(imageUrl)
                      : Image.asset(imageUrl),
                ),
              ),
            ),
            const AppAppBar(showBackArrow: true, actions: [
              CircularIcon(icon: Iconsax.heart, color: Colors.red)
            ]),
          ],
        ),
      ),
    );
  }
}
