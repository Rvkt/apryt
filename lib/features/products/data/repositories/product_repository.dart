import 'package:apryt/core/network/handler/api_handler.dart';
import 'package:apryt/core/network/service/api_service.dart';
import 'package:apryt/features/products/data/models/product_model.dart';
import 'package:apryt/injection/injection_container.dart';

class ProductRepository {
  final ApiService apiService = sl<ApiService>();

  Future<ApiResult<List<Product>>> getProducts() {
    return apiService.getAllProducts();
  }
}
