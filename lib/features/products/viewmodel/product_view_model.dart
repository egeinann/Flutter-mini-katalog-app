import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../model/product_model.dart';
import '../service/product_service.dart';
import '../../../core/network/dio_client.dart';

final productProvider =
    StateNotifierProvider<ProductViewModel, AsyncValue<List<Product>>>((ref) {
      final dio = DioClient().dio;
      final service = ProductService(dio);
      return ProductViewModel(service);
    });

class ProductViewModel extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductService service;

  ProductViewModel(this.service) : super(const AsyncLoading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final products = await service.getProducts();
      state = AsyncData(products);
    } catch (e, stackTrace) {
      print("Product fetch error: $e");
      print("StackTrace: $stackTrace");
      state = AsyncError(e, stackTrace);
    }
  }
}
