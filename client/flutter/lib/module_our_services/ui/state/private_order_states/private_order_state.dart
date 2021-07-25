import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/private_order_screen.dart';

abstract class PrivateOrderState {
  PrivateOrderScreenState screenState;

  PrivateOrderState(this.screenState);

  Widget getUI(BuildContext context);
}