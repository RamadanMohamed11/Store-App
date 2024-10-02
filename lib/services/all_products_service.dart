import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  String baseAddress = "https://fakestoreapi.com";
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await API().get(url: "$baseAddress/products");
    List<ProductModel> allProducts = [];
    for (int i = 0; i < data.length; i++) {
      allProducts.add(ProductModel.fromJson(data[i]));
    }
    return allProducts;
  }
}
