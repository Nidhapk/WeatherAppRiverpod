import 'package:flutter/material.dart';


Widget weatherContainerdetails(
    {required BuildContext contaxt,
    required String weatherDiscription,
    required String temperature,
    required String weatherIcon}) {
  final width = MediaQuery.of(contaxt).size.width;
 // final height = MediaQuery.of(contaxt).size.height;
  return Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(height: 150, width: 150, weatherIcon),
        SizedBox(
          width: width * 0.02,
        ),
        Text.rich(
          TextSpan(
            text: '$weatherDiscription\n',
            style: const TextStyle(
              color: Colors.grey,
            ),
            children: [
              TextSpan(
                text: '$temperature°',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 60,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
