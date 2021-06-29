import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_account/ui/screen/account_screen.dart';
import 'package:twaslna_delivery/module_account/ui/state/account/account_state.dart';

class AccountLoadingState extends AccountState {
  AccountLoadingState(AccountScreenState screenState) : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}