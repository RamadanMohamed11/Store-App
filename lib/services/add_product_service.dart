import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct({required ProductModel product}) async {
    String baseAddress = "https://fakestoreapi.com";
    final dynamic data =
        await API().post(url: "https://fakestoreapi.com/products", body: {
      "title": product.title,
      "price": product.price as String,
      "description": product.description,
      "image": product.image
    });
    return ProductModel.fromJson(data);
  }
}
