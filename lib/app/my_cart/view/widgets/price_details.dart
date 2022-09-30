import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/my_cart/view/cart_screen.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails(
      {Key? key,
      required this.height,
      required this.discout,
      required this.amount})
      : super(key: key);
  final double height;
  final String amount;
  final String discout;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextStyleWidget(
            text: 'Price Details',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Price'),
              Text(amount),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Discount'),
              Text(
                discout,
                style: TextStyle(color: kGreen),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Delivery Charges'),
              Text(
                'Free Delivery',
                style: TextStyle(color: kGreen),
              ),
            ],
          ),
          DividerWidget(
            height: height / 2,
            indent: 10,
            lastIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextStyleWidget(
                text: 'Total Amount',
              ),
              TextStyleWidget(
                text: '${int.parse(amount) - int.parse(discout)}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
