import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/widget/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Products product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF4F4F6);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          product.category ?? 'Product Details',
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: Get.width * 0.055,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Image.network(
                  product.thumbnail ?? '',
                  width: double.infinity,
                  height: Get.height * 0.4,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title ?? 'No title',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: Get.width * 0.050,
                        ),
                      ),
                      Text(
                        '\$${product.price ?? 'N/A'}',
                        style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: Get.width * 0.050, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.category ?? 'No category',
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: Get.width * 0.046,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      StarRating(rating: product.rating ?? 0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    product.description ?? 'No description',
                    style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: Get.width * 0.042,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      minimumSize:
                          const Size(double.infinity, 50), // Button width
                    ),
                    child: Text(
                      'Add to Cart',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: Get.width * 0.042,
                      ),
                    ),
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
