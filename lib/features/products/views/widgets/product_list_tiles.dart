import 'package:flutter/material.dart';
import 'package:machine_task/core/colors/app_colors.dart';
import 'package:machine_task/core/extensions/textstyle_extension.dart';
import 'package:machine_task/features/products/models/product_model.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    "${product?.images?.first}",
                    fit: BoxFit.cover,
                  ),
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
                  child: Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product?.title}",
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),

                Text(
                  "\$${product?.price}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
