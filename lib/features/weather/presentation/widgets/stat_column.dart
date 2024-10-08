import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StatColumn extends StatelessWidget {
  final String imagePath;
  final String label;
  final String value;

  const StatColumn({
    required this.imagePath,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 100,
          height: 100,
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.whiteCl,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.whiteCl,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
