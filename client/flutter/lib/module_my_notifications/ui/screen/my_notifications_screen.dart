import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_auth/authorization_routes.dart';
import 'package:twaslna_delivery/module_my_notifications/state_manager/my_notifications_state_manager.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/state/my_notifications/my_notifications_loaded_state.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/state/my_notifications/my_notifications_loading_state.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/state/my_notifications/my_notifications_state.dart';
import 'package:twaslna_delivery/utils/helpers/custom_flushbar.dart';

@injectable
class MyNotificationsScreen extends StatefulWidget {
  final MyNotificationsStateManager _stateManager;
  MyNotificationsScreen(this._stateManager);

  @override
  MyNotificationsScreenState createState() => MyNotificationsScreenState();
}

class MyNotificationsScreenState extends State<MyNotificationsScreen> {
  late MyNotificationsState currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  Future <void> getNotifications() async {
    widget._stateManager.getNotifications(this);
  }

  void goToLogin(){
    Navigator.of(context).pushNamed(AuthorizationRoutes.LOGIN_SCREEN,arguments:3);
    CustomFlushBarHelper.createError(title:S.current.warnning, message:S.current.pleaseLoginToContinue).show(context);
  }

  @override
  void initState() {
    currentState = MyNotificationsLoadingState(this);
    widget._stateManager.getNotifications(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
    refresh();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus){
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState.getUI(context),
      ),
    );
  }
}
