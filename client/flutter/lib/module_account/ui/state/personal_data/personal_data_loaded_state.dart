import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_account/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_account/request/profile_request.dart';
import 'package:twaslna_delivery/module_account/ui/screen/presonal_data_screen.dart';
import 'package:twaslna_delivery/module_account/ui/state/personal_data/personal_data_state.dart';
import 'package:twaslna_delivery/module_account/ui/widget/update_button.dart';
import 'package:twaslna_delivery/utils/components/custom_feild.dart';
import 'package:twaslna_delivery/utils/helpers/custom_flushbar.dart';
import 'package:twaslna_delivery/utils/images/images.dart';


class PersonalDataLoadedState extends PersonalDataState {
  PersonalDataScreenState screenState;
  ProfileModel? profileModel;
  PersonalDataLoadedState(this.screenState,this.profileModel) : super(screenState){
    nameController.text = profileModel?.name??'';
    locationController.text = profileModel?.location??'';
    image = profileModel?.image ?? ImageAsset.NETWORK ;
  }
  final GlobalKey<FormState> _personal_data = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  late ProfileRequest request;
  String? genders = '' ;
  var gender ;
  late String image;
  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: (){
                      ImagePicker.platform.pickImage(source:ImageSource.gallery,imageQuality: 75).then((value){
                        if (value!=null){
                          screenState.uploadImage(ProfileModel(
                            name: nameController.text.trim(),
                            location: locationController.text.trim(),
                            image: image,
                          ), value.path);
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            Urls.IMAGES_ROOT + image,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                            errorBuilder: (context,error,t){
                              return Image.asset(ImageAsset.LOGO);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Opacity(
                              opacity: 0.9,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Theme.of(context).primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add_a_photo_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Form(
              key: _personal_data,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          S.of(context).name,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      subtitle: CustomFormField(
                        controller: nameController,
                        contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        preIcon: Icon(Icons.person),
                        hintText: S.of(context).nameHint,
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          S.of(context).address,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      subtitle: CustomFormField(
                        controller: locationController,
                        contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        preIcon: Icon(Icons.location_on_rounded),
                        hintText: S.of(context).myAddressHint,
                        last: true,
                      ),
                    ),

                    // ListTile(
                    //   title: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       S.of(context).birthDate,
                    //       style: TextStyle(fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    //   subtitle: CustomFormField(
                    //     readOnly: true,
                    //     preIcon: Icon(Icons.calendar_today_rounded),
                    //     hintText: S.of(context).birthDateHint,
                    //     controller: nameController,
                    //     onTap: () {
                    //       showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(1900, 1, 1),
                    //         lastDate: DateTime.now(),
                    //       ).then((value) {
                    //         if (value != null) {
                    //           nameController.text =
                    //               DateFormat('yyyy - MM - dd').format(value);
                    //           screenState.refresh();
                    //         }
                    //       });
                    //     },
                    //   ),
                    // ),
                    // ListTile(
                    //   title: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       S.of(context).gender,
                    //       style: TextStyle(fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    //   subtitle:Flex(
                    //     direction: Axis.horizontal,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Theme.of(context).backgroundColor,
                    //           ),
                    //           child: RadioListTile(
                    //             title: Text(S.of(context).male),
                    //             value:'male',
                    //             groupValue:genders,
                    //             onChanged: (String? value){
                    //               genders = value;
                    //               screenState.refresh();
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(width: 16,),
                    //       Expanded(
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Theme.of(context).backgroundColor,
                    //           ),
                    //           child: RadioListTile(
                    //             title: Text(S.of(context).female),
                    //             value:'female',
                    //             groupValue:genders,
                    //             onChanged: (String? value){
                    //               genders = value;
                    //               screenState.refresh();
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: UpdateButton(onPressed:(){
              if (_personal_data.currentState!.validate()) {
                request = ProfileRequest(
                  clientName: nameController.text.trim(),
                  location: locationController.text.trim(),
                  image: image.contains('http') ? '' : image
                );
                screenState.postClientProfile(request);
              }
            })),
      ],
    );
  }
}
