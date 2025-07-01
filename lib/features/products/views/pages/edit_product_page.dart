import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/core/colors/app_colors.dart';
import 'package:machine_task/core/extensions/textstyle_extension.dart';
import 'package:machine_task/features/products/bloc/product_bloc.dart';
import 'package:machine_task/features/products/models/product_model.dart';
import 'package:machine_task/features/products/views/widgets/button_widget.dart';

class EditProductPage extends StatefulWidget {
  final Product product;
  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final prod = widget.product;

    titleController.text = prod.title ?? '';
    priceController.text = prod.price?.toString() ?? '';
    ratingController.text = prod.rating?.toString() ?? '';
    descController.text = prod.description ?? '';
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    ratingController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            log("Current state: $state");
            if (state is ProductEditSuccess) {
              log("Edit success - refreshing products");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,

                  backgroundColor: AppColors.kBlack,
                  content: Text(
                    'Product Edited Successfully!',
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              );
              context.read<ProductBloc>().add(GetProductEvent());
              Navigator.pop(context);
            } else if (state is ProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.message}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return ButtonWidget(
              name: state is ProductLoading ? "Saving..." : "Save",
              onTap: state is ProductLoading
                  ? null
                  : () {
                      final title = titleController.text.trim();
                      final desc = descController.text.trim();
                      final rating = ratingController.text.trim();
                      final price = priceController.text.trim();

                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<ProductBloc>().add(
                          EditProductEvent(
                            id: widget.product.id!,
                            title: title,
                            desc: desc,
                            rating: rating,
                            price: price,
                          ),
                        );
                      }
                    },
            );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        title: Text("Edit Product", style: context.titleLarge.copyWith()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  label: 'Title',
                  controller: titleController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter title' : null,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Price',
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter price';
                    if (double.tryParse(value) == null) return 'Invalid price';
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Rating',
                  controller: ratingController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter rating';
                    final rating = double.tryParse(value);
                    if (rating == null || rating < 0 || rating > 5) {
                      return 'Rating must be 0–5';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Description',
                  controller: descController,
                  maxLines: 8,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Enter description'
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.kBlack),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 215, 215, 215),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
