import 'package:flutter/material.dart';

Widget subDetails(
    {required BuildContext context,
    required String value,
    required String title,
    required String icon}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Padding(
    padding: EdgeInsets.all(
      width * 0.035,
    ),
    child: SizedBox(
      height: width * 0.25,
      width: width * 0.176,
      child: Column(
        children: [
          Image.asset(
            height: 30,
            width: 30,
            icon,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(
                255,
                113,
                113,
                113,
              ),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    ),
  );
}
