import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/my_orders_screen.dart';

abstract class MyOrdersState {
  final MyOrdersScreenState myOrdersScreenState;

  MyOrdersState(this.myOrdersScreenState);

  Widget getUI(BuildContext context);
}
