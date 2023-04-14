import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:apicalling/utils/multi2.dart';
import 'package:apicalling/utils/multi5.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/multiText.dart';
import '../utils/shadowText.dart';
import '../utils/slider.dart';
import 'multi3.dart';
import 'multi6.dart';


class TrendyLook extends StatelessWidget {
  String? img;
  String? title;
  String? desc;
  TrendyLook({super.key,required this.img,required this.title,required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0xffD0D5F1),width: 2),
        image: DecorationImage(image: NetworkImage("$img"),fit: BoxFit.cover)
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child:Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xff686799).withOpacity(0.6),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      // color: Colors.transparent.withOpacity(0.2),
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Multi5(color: Color(0xffD0D5F1), subtitle: title!.length>35?title.toString().substring(0,34):"${title}...", weight: FontWeight.bold, size: 12),
                                    SizedBox(height: 5.h,),
                                    Multi6(color: Color(0xffD0D5F1), subtitle: desc!.length>120?desc.toString().substring(0,119):"${desc}...", weight: FontWeight.bold, size: 10)
                                  ]),
                                ),
                      ),
                   ),
                ),
                
              ),

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child:Container(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xff686799).withOpacity(0.6),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      // color: Colors.transparent.withOpacity(0.2),
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Container(
                        height: 20.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          gradient: LinearGradient(colors: [Color(0xffD0D5F1),Color.fromARGB(255, 170, 174, 195)]),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              color: Color(0xff36454f),
                              blurRadius: 2,
                              spreadRadius: 1
                            )
                          ]
                        ),
                        child: Center(
                          child: Multi3(color: Color(0xff2F2D3A), subtitle: "Read..", weight: FontWeight.bold, size: 9),
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 15.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/like1.png"),fit: BoxFit.contain)
                            ),
                          ),
                          SizedBox(width: 3.w,),
                          Container(
                            height: 15.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/save1.png"),fit: BoxFit.contain)
                            ),
                          ),
                          SizedBox(width: 3.w,),
                          Container(
                            height: 15.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/share1.png"),fit: BoxFit.contain)
                            ),
                          ),
                        ],
                      )
                                    // Multi5(color: Color(0xffD0D5F1), subtitle: "Jamie Foxx Suffers Medical Complication - E! NEWS", weight: FontWeight.bold, size: 12),
                                    // SizedBox(height: 5.h,),
                                    // Multi6(color: Color(0xffD0D5F1), subtitle: "Jamie Foxx’s daughter Corinne Foxx shared that her father “experienced a medical complication...", weight: FontWeight.bold, size: 10)
                                  ]),
                                ),
                      ),
                   ),
                ),
                
              ),

            ),
          )
        ],
      ),
    );
  }
}