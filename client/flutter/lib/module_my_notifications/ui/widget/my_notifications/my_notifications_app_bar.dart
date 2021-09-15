import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/utils/components/costom_search.dart';
import 'package:twaslna_delivery/utils/effect/hidder.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class MyNotificationsAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.asset('assets/images/notifications.png',width: 220,)),
        Flex(
          direction: Axis.vertical,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 25.0, left: 25, top: 16, bottom: 16),
              child: Container(
                width: double.maxFinite,
                child: Text(
                  S.of(context).notifications,
                  style: StyleText.appBarHeaderStyle,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Hider(
              active: false,
              child: Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 25, top: 16),
                child: CustomDeliverySearch(
                  hintText: S.of(context).searchForNotifications,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Divider(
                color: Theme.of(context).backgroundColor,
                thickness: 2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
