import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/state_manager/order_status_state_manager.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_loading_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_state.dart';
import 'package:twaslna_delivery/module_stores/request/rate_store_request.dart';

@injectable
class OrderStatusScreen extends StatefulWidget {
  final OrderStatusStateManager _stateManager;

  OrderStatusScreen(this._stateManager);

  @override
  OrderStatusScreenState createState() => OrderStatusScreenState();
}

class OrderStatusScreenState extends State<OrderStatusScreen> {
  late OrderStatusState currentState;
  bool flagOrderStatusId = true;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
 void getOrderStatus(int id){
   widget._stateManager.getOrderDetails(id, this);
 }
  void rateCaptain(RateCaptainRequest request){
    widget._stateManager.rateCaptain(request, this);
  }

  @override
  void initState() {
    super.initState();
    currentState = OrderStatusLoadingState(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
  }
  String? orderNumber;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (flagOrderStatusId && args is String) {
      orderNumber = args;
      widget._stateManager.getOrderDetails(int.parse(args), this);
      flagOrderStatusId = false;
    }
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState.getUI(context),
      ),
    );
  }
  @override
  void dispose(){
    widget._stateManager.newActionSubscription?.cancel();
    super.dispose();
  }
}
