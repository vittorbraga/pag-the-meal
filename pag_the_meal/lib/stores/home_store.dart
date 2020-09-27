import 'package:mobx/mobx.dart';
import 'package:pag_the_meal/models/category_model.dart';
import 'package:pag_the_meal/models/product_model.dart';
import 'package:pag_the_meal/services/http_service.dart';
part 'home_store.g.dart';
class HomeStore = _HomeStore with _$HomeStore;
abstract class _HomeStore with Store {
  @observable
  String search = "";
  @action
  void setSearch(String value) => this.search = value;

  @observable
  List<Category> category;
  @action
  fetchCategoryList() {
    _loadCategories().then((value) => this.category = value);
  }
  Future<List<Category>> _loadCategories() async {
    try {
      return await HttpService().getCategories();
    } catch (e) {
      return null;
    }
  }

  @observable
  List<Product> product;
  @action
  fetchProductList() {
    this.product = null;
    _loadProducts().then((value) => this.product = value);
  }
  Future<List<Product>> _loadProducts() async {
    try {
      return await HttpService().getProducts();
    } catch (e) {
      return null;
    }
  }
  @action
  getchProductListByCategory(String category) {
    this.product = null;
    _loadProductsByCategory(category).then((value) => this.product = value);
  }
  Future<List<Product>> _loadProductsByCategory(String category) async {
    try {
      return await HttpService().getProductsByCategory(category);
    } catch (e) {
      return null;
    }
  }
}