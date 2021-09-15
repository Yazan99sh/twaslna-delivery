import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_delivery/module_stores/request/rate_store_request.dart';
import 'package:twaslna_delivery/module_stores/state_manager/store_products_state_manager.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_loading_state.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';
import 'package:twaslna_delivery/utils/models/store.dart';

@injectable
class StoreProductsScreen extends StatefulWidget {
  final StoreProductsStateManager stateManager;
  final AuthService _authService;
  StoreProductsScreen(this.stateManager,this._authService);

  @override
  StoreProductsScreenState createState() => StoreProductsScreenState();
}

class StoreProductsScreenState extends State<StoreProductsScreen> {
  late StoreProductsState currentState;
  late AsyncSnapshot snapshot = AsyncSnapshot.nothing();
  late AuthService authService;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getProductsByCategory(storeId , categoryId) async {
     widget.stateManager.getProductsByCategory(storeId, categoryId);
  }

  void getStoresProducts(int id){
    widget.stateManager.getStoresProducts(id, this);
  }

  void rateStore(RateStoreRequest request){
    widget.stateManager.rateStore(request, this);
  }

  @override
  void initState() {
    currentState = StoreProductsLoadingState(this);
    authService = widget._authService;
    widget.stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) setState(() {});
    });
    widget.stateManager.categoryStream.listen((event) {
      snapshot = event;
      if (mounted) setState(() {});
    });

    super.initState();
  }
  bool flag = true;
  late String title;
  late String backgroundImage;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (flag && args is StoreModel) {
      title = args.storeOwnerName;
      widget.stateManager.getStoresProducts(args.id, this);
      flag = false;
    }
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: currentState.getUI(context),
        ),
      ),
    );
  }
}
