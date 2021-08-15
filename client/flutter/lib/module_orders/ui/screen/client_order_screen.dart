import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_auth/authorization_routes.dart';
import 'package:twaslna_delivery/module_main/main_routes.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/state_manager/client_order_state_manager.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_state.dart';
import 'package:twaslna_delivery/utils/helpers/custom_flushbar.dart';

@injectable
class ClientOrderScreen extends StatefulWidget {
  final ClientOrderStateManager _clientOrderStateManager;

  ClientOrderScreen(this._clientOrderStateManager);

  @override
  ClientOrderScreenState createState() => ClientOrderScreenState();
}

class ClientOrderScreenState extends State<ClientOrderScreen> {
  late ClientOrderState currentState;
  LatLng? myPos;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void postClientOrder(ClientOrderRequest request) {
    widget._clientOrderStateManager.postClientOrder(request, this);
  }

  void moveDecision(bool success, [String err = '']) {
    if (success) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(MainRoutes.MAIN_SCREEN, (route) => false);
      CustomFlushBarHelper.createSuccess(
        title: S.of(context).warnning,
        message: S.of(context).successCreateOrder,
      )..show(context);
    } else {
      Navigator.of(context).pop();
      CustomFlushBarHelper.createError(
          title: S.of(context).warnning, message: err)
        ..show(context);
    }
  }

  void goToLogin(){
    Navigator.of(context).pushNamed(AuthorizationRoutes.LOGIN_SCREEN,arguments:true);
    CustomFlushBarHelper.createError(title:S.current.warnning, message:S.current.pleaseLoginToMakeOrder).show(context);
  }

  @override
  void initState() {
    super.initState();
    currentState = ClientOrderLoadedState(this);
    widget._clientOrderStateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    defaultLocation().then((value) {
      if (value == null) {
      } else {
        myPos = value;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var focus = FocusScope.of(context);
          if (focus.canRequestFocus) {
            focus.unfocus();
          }
        },
        child: Scaffold(
          body: currentState.getUI(context),
        ));
  }

  Future<LatLng?> defaultLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    var myLocation = await Location.instance.getLocation();
    LatLng myPos = LatLng(myLocation.latitude ?? 0, myLocation.longitude ?? 0);
    return myPos;
  }
}
