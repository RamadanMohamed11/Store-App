import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({required ProductModel product}) async {
    String baseAddress = "https://fakestoreapi.com";
    final dynamic data =
        await API().put(url: "$baseAddress/products/${product.id}", body: {
      "title": product.title,
      "price": product.price.toString(),
      "description": product.description,
      "image": product.image,
      "category": product.category,
    });
    return ProductModel.fromJson(data);
  }
}
