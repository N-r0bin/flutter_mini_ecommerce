import 'package:flutter/material.dart';

import '../../../../utilis/constants/app_colors.dart';
import '../../curved_edges_widget.dart';
import 'circular_container.dart';

class MainHeaderContainer extends StatelessWidget {
  const MainHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  showBorder: false,
                ),
              ),
              Positioned(
                top: 100,
                right: -200,
                child: CircularContainer(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  showBorder: false,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
