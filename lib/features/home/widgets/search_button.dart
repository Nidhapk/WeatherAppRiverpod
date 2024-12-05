import 'package:flutter/material.dart';

Widget searchButton(
    {required BuildContext context,
    required,
    required void Function()? onTap}) {
  final width = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(width * 0.01),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15)
        ],
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 116, 69, 155),
            Color.fromARGB(255, 87, 63, 197),
          ],
        ),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 2,
          ),
          Icon(
            Icons.search,
            size: 18,
          ),
          Text(' Search  '),
        ],
      ),
    ),
  );
}
