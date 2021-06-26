import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_home/ui/screen/home_screen.dart';
abstract class HomeState {
  final HomeScreenState homeScreenState;
  HomeState(this.homeScreenState);
  Widget getUI(BuildContext context);
}