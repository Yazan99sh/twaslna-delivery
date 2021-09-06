import 'package:flutter/material.dart';
import 'package:twaslna_delivery/utils/models/product.dart';
import 'package:twaslna_delivery/utils/models/store.dart';
import 'package:twaslna_delivery/module_search/response/search_response.dart';

class SearchModel {
  String? _error;

  bool _empty = false;

  List<StoreModel> store = [];

  List<ProductModel> product = [];

  SearchModel? _data;

  SearchModel({required this.product, required this.store});

  SearchModel.Data(Data data) {
    data.products?.forEach((element) {
      product.add(ProductModel(
        storeName: element.storeOwnerName ?? '',
        storeImage: element.storeImage ?? '',
        deliveryCost: element.deliveryCost ?? 0,
        title: element.productName ?? '',
        image: element.productImage ?? '',
        price: element.productPrice ?? 0,
        id: element.storeOwnerProfileID ?? 0,
      ));
    });

    data.stores?.forEach((element) {
      store.add(StoreModel(
          deliveryCost: 0,
          id: element.id ?? 0,
          storeOwnerName: element.storeOwnerName ?? '',
          image: element.image ?? '',
          hasProducts: element.hasProducts ?? false,
          privateOrders: element.privateOrders ?? false));
    });

    _data = SearchModel(product: product, store: store);
  }

  SearchModel.Empty() {
    this._empty = true;
  }

  SearchModel.Error(this._error);

  bool get isEmpty => _empty;

  bool get hasError => _error != null;

  String get error => _error ?? '';

  SearchModel get data => _data ?? SearchModel.Empty();
}
