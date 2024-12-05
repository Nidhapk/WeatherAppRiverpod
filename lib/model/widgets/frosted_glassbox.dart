import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/features/home/widgets/weather_cnontainer_details.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox(
      {Key? key,
      required this.theWidth,
      required this.theHeight,
      required this.weatherDiscription,
      required this.temperature,
      required this.weatherIcon})
      : super(key: key);

  final double theWidth;
  final double theHeight;
  final String weatherDiscription;
  final int temperature;
  final String weatherIcon;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.035),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: theWidth,
          height: theHeight,
          color: Colors.transparent,
          //we use Stack(); because we want the effects be on top of each other,
          //  just like layer in photoshop.
          child: Stack(
            children: [
              //blur effect ==> the third layer of stack
              BackdropFilter(
                filter: ImageFilter.blur(
                  //sigmaX is the Horizontal blur
                  sigmaX: 10.0,
                  //sigmaY is the Vertical blur
                  sigmaY: 10.0,
                ),
                //we use this container to scale up the blur effect to fit its
                //  parent, without this container the blur effect doesn't appear.
                child: Container(),
              ),
              //gradient effect ==> the second layer of stack
              Container(
                //  padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.withOpacity(0.05)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //begin color
                        const Color.fromARGB(255, 128, 120, 230)
                            .withOpacity(0.05),
                        //end color
                        Colors.grey.withOpacity(0.02),
                      ]),
                ),

                //child ==> the first/top layer of stack
                child: weatherContainerdetails(
                    contaxt: context,
                    weatherDiscription: weatherDiscription,
                    temperature: temperature.toString(),
                    weatherIcon: weatherIcon),
              )
            ],
          ),
        ),
      ),
    );
  }
}
