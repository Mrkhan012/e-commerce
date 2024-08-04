import 'dart:convert';

import 'package:get/get.dart';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs; // Default index

  void changeIndex(int index) {
    selectedIndex.value = index; // Update the selected index
  }
}

class ProductController extends GetxController {
  var products = <Products>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading(true);
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);
        final productData = ProductData.fromJson(data);
        products.assignAll(productData.products ?? []);
      } else {
        print(errorMessage);
        isError(true);
        errorMessage('Failed to load products');
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
