import 'dart:ui';

import 'package:apicalling/utils/multi3.dart';
import 'package:apicalling/utils/shadowText.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../utils/multiText.dart';
import 'multi5.dart';


class Type2 extends StatelessWidget {
  String? img;
  String? catName;
  String? startingP;
  Type2({super.key,required this.img,required this.catName,required this.startingP});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xffD0D5F1),width: 2),
        image: DecorationImage(
            image:AssetImage("$img"),
            fit: BoxFit.cover
             )
      ),
      child: Stack(children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child:Container(
                            height: 90.h,
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
                                  child: Column(
                                    children: [
                                      ShadowText(color:Color(0xffD0D5F1) , shadowColor:Color(0xff2F2D3A) , subtitle: "$catName", weight: FontWeight.bold, size: 16),
                                      SizedBox(height: 4.h,),
                                      Multi5(color: Color(0xffD0D5F1) , subtitle: "subti subtitle subtitletle subtitle subtitle subtitle", weight: FontWeight.bold, size: 10),
                                      SizedBox(height: 4.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
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
                          child: Multi3(color: Color(0xff2F2D3A), subtitle: "visit...", weight: FontWeight.bold, size: 9),
                        ),
                      ),
                                        ],
                                      )
                                    ],
                                  )
                                ),
                      ),
                   ),
                ),
                
              ),

            ),
          )
      ],)
    );
  }
}