import 'package:dio/dio.dart';
import 'package:pag_the_meal/models/category_model.dart';
import 'package:pag_the_meal/models/product_model.dart';

class HttpService {
  final String URL = "https://www.themealdb.com/api/json/v1/1/";
  Dio dio;
  HttpService() {
    dio = Dio();
  }

  Future getCategories() async {
    Response response = await dio.get(URL + 'categories.php');
    List responseJson = response.data["categories"];
    return responseJson.map((m) => new Category.fromJson(m)).toList();
  }

  Future getProducts() async {
    Response response = null;
    List<Product> responseJson = [];
    for(int i=0; i<5; i++) {
      response = await dio.get(URL + 'random.php');
      responseJson.add(Product.fromJson(response.data["meals"][0]));
    }
    return responseJson;
  }

  Future getProductsByCategory(String category) async {
    Response response = await dio.get(URL + 'filter.php?c='+category);
    List responseJson = response.data["meals"];
    return responseJson.map((m) => new Product.fromJson(m)).toList();
  }

}