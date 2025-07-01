import 'package:flutter/material.dart';
import 'package:machine_task/core/colors/app_colors.dart';
import 'package:machine_task/core/extensions/textstyle_extension.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String name;
  const ButtonWidget({super.key, this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.kBlack,
        ),
        child: Center(
          child: Text(
            name,
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
