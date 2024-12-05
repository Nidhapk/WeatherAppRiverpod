import 'package:flutter/material.dart';

Widget dayDetails(
    {required BuildContext context,
    required String day,
    required String icon,
    required String minTemperature,
    required String maxTemperature}) {
  final width = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: width * 0.31,
        child: Text(
          '   $day',
          style: const TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
      Image.asset(
        height: 35,
        width: 35,
        icon,
      ),
      SizedBox(
        width: width * 0.178,
      ),
      Text(
        '$minTemperature° / $maxTemperature°   ',
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      )
    ],
  );
}
