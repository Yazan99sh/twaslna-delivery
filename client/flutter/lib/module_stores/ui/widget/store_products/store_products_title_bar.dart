import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
class StoreProductsTitleBar extends StatelessWidget {
 final String title;
 final double rate;
 final int views;
 final double deliveryCost;
 StoreProductsTitleBar({required this.title,required this.rate,required this.views,required this.deliveryCost});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 16,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              decoration: BoxDecoration(
                color:
                Theme.of(context).cardColor.withOpacity(0.65),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${S.of(context).views} $views',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Icon(Icons.circle, size: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      rate.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0),
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.blue[700],
                    ),
                  ),
                  Container(
                    width: 8,
                  ),
                  Icon(Icons.circle, size: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${S.of(context).deliverPrice} $deliveryCost ${S.of(context).sar}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
