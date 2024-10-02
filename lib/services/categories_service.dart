import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategories(
      {required String categoryName}) async {
    String baseAddress = "https://fakestoreapi.com";
    List<dynamic> data =
        await API().get(url: "$baseAddress/products/category/$categoryName");
    List<ProductModel> allCategoryProducts = [];
    for (int i = 0; i < data.length; i++) {
      allCategoryProducts.add(ProductModel.fromJson(data[i]));
    }
    return allCategoryProducts;
  }
}
