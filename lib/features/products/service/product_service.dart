import 'package:dio/dio.dart';
import '../model/product_model.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  Future<List<Product>> getProducts() async {
    final response = await dio.get("products");

    final List list = response.data["products"];

    return list.map((e) => Product.fromJson(e)).toList();
  }
}