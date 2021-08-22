
import 'package:flutter/material.dart';
import 'package:twaslna_captain/module_profile/ui/screen/edit_profile/edit_profile.dart';

abstract class ProfileState {
  final EditProfileScreenState screenState;
  ProfileState(this.screenState);

  Widget getUI(BuildContext context);
}