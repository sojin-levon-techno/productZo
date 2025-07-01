import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/core/colors/app_colors.dart';
import 'package:machine_task/core/extensions/textstyle_extension.dart';
import 'package:machine_task/features/products/bloc/product_bloc.dart';
import 'package:machine_task/features/products/views/pages/view_page.dart';
import 'package:machine_task/features/products/views/widgets/product_list_tiles.dart';
import 'package:machine_task/features/products/views/widgets/shimmer_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductLoading) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 0.66,
              ),
              itemBuilder: (_, index) {
                return ShimmerProductTileWithBones();
              },
              itemCount: 16,
            );
          }
          if (state is ProductSuccess) {
            final result = state.result.products;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  surfaceTintColor: AppColors.kWhite,
                  pinned: false,
                  floating: true,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.shopping_cart, color: AppColors.kBlack),
                    ),
                  ],
                  title: Text(
                    "Productzo",
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: AppColors.kWhite,
                ),
                SliverGrid.builder(
                  itemCount: result?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.66,
                  ),
                  itemBuilder: (context, index) {
                    final product = result?[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => ViewPage(product: product!),
                          ),
                        );
                      },
                      child: ProductListTile(product: product)
                          .animate()
                          .fade(duration: 500.ms, delay: (index * 100).ms)
                          .slideY(
                            begin: 1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                    );
                  },
                ),
              ],
            );
          }
          if (state is ProductError) {
            log(state.message);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 0.66,
              ),
              itemBuilder: (_, index) {
                return ShimmerProductTileWithBones();
              },
              itemCount: 16,
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 0.66,
            ),
            itemBuilder: (_, index) {
              return ShimmerProductTileWithBones();
            },
            itemCount: 16,
          );
        },
      ),
    );
  }
}
