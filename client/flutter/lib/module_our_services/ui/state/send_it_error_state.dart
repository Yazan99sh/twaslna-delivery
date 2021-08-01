import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/send_it_screen.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_state.dart';

class SendItErrorState extends SendItState {
  final String error;

  SendItErrorState(SendItScreenState screenState, this.error)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}
