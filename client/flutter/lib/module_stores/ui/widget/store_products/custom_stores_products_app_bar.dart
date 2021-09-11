import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/utils/components/rate_dialog.dart';
import 'package:twaslna_delivery/utils/effect/hidder.dart';
import 'package:twaslna_delivery/utils/images/images.dart';
class CustomStoresProductsAppBar extends StatelessWidget {
  final Function(double) onRate;
  final bool isLogin;
  final String image;
  CustomStoresProductsAppBar({required this.onRate,required this.isLogin,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 25),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1,),
          Hider(
            active:isLogin,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 25),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (context) => RatingAlertDialog(
                        image: image,
                        title: S.current.rateStore,
                        message:S.current.rateStoreMessage,
                        onPressed: (rate) {
                          onRate(rate);
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow.withOpacity(0.85),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
