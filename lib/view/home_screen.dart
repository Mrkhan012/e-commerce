import 'package:e_commerce_app/utils/app_decoration.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/details_screen.dart';
import 'package:e_commerce_app/widget/bottomnav_bar.dart';
import 'package:e_commerce_app/widget/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart'; // Adjust import path as needed

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());
    final ProductController homeController = Get.put(ProductController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F6),
        body: Obx(() {
          switch (bottomNavController.selectedIndex.value) {
            case 0:
              return _buildProductScreen(homeController);
            case 1:
              return const Center(child: Text('Cart Screen'));
            case 2:
              return const Center(child: Text('Bag Screen'));
            case 3:
              return const Center(child: Text('Favorite Screen'));
            case 4:
              return const Center(child: Text('Profile Screen'));
            default:
              return const Center(child: Text('Home Screen'));
          }
        }),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  Widget _buildProductScreen(ProductController homeController) {
    return Obx(() {
      if (homeController.isLoading.value) {
        return const Center(
          child: SpinKitCircle(
            color: Colors.red,
            size: 50.0,
          ),
        );
      } else if (homeController.isError.value) {
        return Center(
          child: Text('Error: ${homeController.errorMessage.value}'),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Text(
                "Products",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: Get.width * 0.060,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Super summer sale",
                style: theme.textTheme.bodySmall!.copyWith(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: homeController.products.length,
                itemBuilder: (context, index) {
                  final product = homeController.products[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(product: product));
                    },
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        decoration: AppDecoration.outlineGrayA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: ListTile(
                          leading: Stack(
                            children: [
                              Image.network(
                                product.thumbnail ?? '',
                                width: Get.width * 0.25,
                                height: Get.height * 0.2,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Text(
                                    '-${product.discountPercentage ?? 0}%',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: Get.width * 0.030,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StarRating(
                                  rating: product.rating ?? 0,
                                ),
                                Text(
                                  product.category ?? 'No title',
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    fontSize: Get.width * 0.042,
                                  ),
                                ),
                                Text(
                                  product.title ?? 'No title',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: Get.width * 0.042,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Row(
                              children: [
                                Text(
                                  '\$${product.price ?? 'N/A'}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '\$${product.price ?? 'N/A'}',
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    fontSize: Get.width * 0.042,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    });
  }
}
