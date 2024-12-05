import 'package:flutter/material.dart';
import 'package:weather_app/common/textstyles.dart';

Widget placeText(
    {required BuildContext context,
    required String name,
    required String region,
    required String country}) {
  return Text.rich(
    TextSpan(
      text: '$name\n',
      style: Theme.of(context).textTheme.displayLarge,
      children: [
        TextSpan(
          text: '$region, ',
          style: TextStyles().placeStyle,
        ),
        TextSpan(
          text: ' $country',
          style: TextStyles().placeStyle,
        )
      ],
    ),
  );
}
