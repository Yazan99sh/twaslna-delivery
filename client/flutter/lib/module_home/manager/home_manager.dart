import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_home/repository/home_repository.dart';
import 'package:twaslna_delivery/module_home/response/best_store.dart';
import 'package:twaslna_delivery/module_home/response/products.dart';
import 'package:twaslna_delivery/module_home/response/store_categories.dart';
import 'package:twaslna_delivery/module_stores/response/store_category_list.dart';
@injectable
class HomeManager{
  final HomeRepository _homeRepository;
  HomeManager(this._homeRepository);
  Future<ProductsResponse?> getTopProducts() => _homeRepository.getTopProducts();
  Future<StoreCategoriesResponse?> getStoreCategories() => _homeRepository.getStoreCategories();
  Future <StoreCategoryList?> getBestStores() => _homeRepository.getBestStores();
}