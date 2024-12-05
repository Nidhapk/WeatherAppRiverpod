import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget customsearchBar({
  required BuildContext context,required TextEditingController controller
}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Padding(
    padding: EdgeInsets.only(
      left: width * 0.05,
      right: width * 0.05,
      top: height * 0.05,
      bottom: height * 0.05,
    ),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.4,
            ),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(
              2,
              4,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: const Color.fromARGB(
          255,
          16,
          15,
          16,
        ),
        border: Border.all(
          color: const Color.fromARGB(
            31,
            153,
            143,
            170,
          ),
        ),
      ),
      child: TextFormField(controller: controller,
        decoration: InputDecoration(
          hintText: 'Search for city',
          hintStyle: Theme.of(context).textTheme.bodySmall,
          contentPadding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}


