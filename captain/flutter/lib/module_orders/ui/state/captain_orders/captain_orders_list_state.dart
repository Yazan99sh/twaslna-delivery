import 'package:flutter/material.dart';
import 'package:twaslna_captain/module_orders/ui/screens/captain_orders/captain_orders.dart';


abstract class CaptainOrdersListState {
  CaptainOrdersScreenState screenState;

  CaptainOrdersListState(this.screenState);

  Widget getUI(BuildContext context);
}
