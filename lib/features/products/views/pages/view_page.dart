import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machine_task/core/colors/app_colors.dart';
import 'package:machine_task/core/extensions/textstyle_extension.dart';
import 'package:machine_task/features/products/models/product_model.dart';
import 'package:machine_task/features/products/views/pages/edit_product_page.dart';
import 'package:machine_task/features/products/views/widgets/button_widget.dart';

class ViewPage extends StatefulWidget {
  final Product product;
  const ViewPage({super.key, required this.product});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ButtonWidget(
          name: "Edit Product",
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => EditProductPage(
                product: widget.product,
              )),
            );
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 232, 232, 232),
            surfaceTintColor: const Color.fromARGB(255, 232, 232, 232),

            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
            ),
            pinned: true,
            expandedHeight: 275.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${widget.product.images?.first}",
                fit: BoxFit.cover,
              ),
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
            stretch: true,

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                height: 32.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.kGrey,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "${widget.product.title}",
                          style: context.titleLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "\$${widget.product.price}",
                          style: context.titleLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "⭐ ${widget.product.rating}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Text(
                    "${widget.product.description}",
                    style: context.bodyLarge.copyWith(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
