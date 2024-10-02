import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    String baseAddress = "https://fakestoreapi.com";
    List<dynamic> allCategories =
        await API().get(url: "$baseAddress/products/categories");
    return allCategories;
  }
}
