import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_search/search_routes.dart';
import 'package:twaslna_delivery/module_search/ui/screen/search_screen.dart';

@injectable
class SearchModule extends YesModule {
  final SearchScreen _searchScreen;

  SearchModule(this._searchScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      SearchRoutes.SEARCH_SCREEN : (context) => _searchScreen
    };
  }
}
