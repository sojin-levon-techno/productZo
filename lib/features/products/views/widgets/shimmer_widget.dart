import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:machine_task/core/colors/app_colors.dart';

class ShimmerProductTileWithBones extends StatelessWidget {
  const ShimmerProductTileWithBones({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: Duration(milliseconds: 1200),
      ),
      child: Card(
        color: AppColors.kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Bone.square(size: double.infinity),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Bone.circle(size: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title skeleton
                  Bone.text(words: 2),
                  SizedBox(height: 8),
                  // Subtitle skeleton
                  Bone.text(words: 1, fontSize: 14),
                  SizedBox(height: 12),
                  // Price skeleton
                  Bone.text(words: 1, fontSize: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
