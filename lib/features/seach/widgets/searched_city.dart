import 'package:flutter/material.dart';

Widget searchedCityContainer({
  required BuildContext context,
  required String name,
  required String temperature,
  required String region,
  required String country,
  required String weatherDiscription,
  required String image,
}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Padding(
        padding: EdgeInsets.only(
            left: width * 0.05, right: width * 0.05, bottom: height * 0.05),
        child: Container(
          // width: 300, // Outer container width
          height: 180, // Outer container height
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                )
              ],
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(
                    255,
                    55,
                    50,
                    103,
                  ),
                  Color.fromARGB(
                    210,
                    29,
                    27,
                    30,
                  ),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
              ),
              //color: Color(0xFF4838D1), // Outer background color
              border: Border.all(
                color: const Color.fromARGB(
                  255,
                  126,
                  126,
                  127,
                ),
                width: 0.1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ) // Rounded corners
              ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temperature°',
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //SizedBox(height: 5),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$region, $country',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    weatherDiscription,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        left: 150,
        bottom: 50,
        child: Image.asset(
          height: 200,
          width: 200,
          'assets/11d.png',
        ),
      )
    ],
  );
}
