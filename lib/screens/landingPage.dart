import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:apicalling/classes/trendy.dart';
import 'package:apicalling/utils/multi6.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../provider/provider1.dart';
import '../utils/categories.dart';
import '../utils/multi3.dart';
import '../utils/multiText.dart';
import '../utils/shadowText.dart';
import '../utils/slider.dart';
import '../utils/trendyNews.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff2F2D3A),
        body:SafeArea(
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: double.infinity,
                    height: 55.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: AvatarGlow(
                              endRadius: 60.0,
                              // glowColor: Colors.red,
                              child: Material(
                                // Replace this child with your own
                                elevation: 8.0,
                                shadowColor: Colors.grey,
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[100],
                                  child: Image.asset(
                                    'assets/menu.png',
                                    height: 18.h,
                                  ),
                                  radius: 20.r,
                                ),
                              ),
                            ),
                          );
                        }),
                        Multi(
                            color: Color(0xffD0D5F1),
                            subtitle: "News Live",
                            weight: FontWeight.bold,
                            size: 16),
                        AvatarGlow(
                          endRadius: 60.0,
                          // glowColor: Colors.red,
                          child: Material(
                            // Replace this child with your own
                            shadowColor: Colors.grey,
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              child: Image.asset(
                                'assets/cart.png',
                                height: 22.h,
                              ),
                              radius: 20.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 16,
                          child: Container(
                            height: 40.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: 3.w, left: 3.w),
                              child: GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   val = true;
                                  // });
                                },
                                child: TextField(
                                  // controller: _searchController,
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     val = true;
                                  //   }
                                  //   );
                                  // },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search_outlined,
                                      color: Color(0xffCC0006),
                                      size: 16,
                                      // weight: 200,
                                    ),

                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Search here",
                                    // hintStyle: TextStyle(
                                    //     color: Colors.grey,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                // image:DecorationImage(image: AssetImage("assets/filter.png"),fit: BoxFit.cover),
                                color: Color(0xffD0D5F1),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/filter.png",
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                            ))
                      ],
                    ),
                    
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10.w),
                    child: MyApp2(),
                  ),
                  SizedBox(height: 15.h,),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Multi6(color: Color(0xffD0D5F1), subtitle: "Trending News", weight: FontWeight.bold, size: 18),
                        Container()
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10.w),
                    child: FutureBuilder<List<Trendy>>(
                      
                        future: Provider11.trendyNews(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Trendy> newsList = snapshot.data!;
                            return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: newsList.map((news) {
                              return Padding(
                                padding:EdgeInsets.only(right: 5.w),
                                child: TrendyLook(title: news.title, desc: news.descr, img: news.imageUrl),
                              );
                            }).toList(),
                          ),
                        );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                  
                          // By default, show a loading spinner
                          return CircularProgressIndicator();
                        },
                                  ),
                  ),
 SizedBox(height: 15.h,),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Multi6(color: Color(0xffD0D5F1), subtitle: "Top Categories", weight: FontWeight.bold, size: 28),
                        Container()
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                   Padding(
                     padding:EdgeInsets.symmetric(horizontal: 10.w),
                     child: StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.4,
                              child: Type2(
                                img: "assets/bussinessNews.jpg",
                            
                                catName: "Bussiness News..",
                                startingP: "Starting Rs 10000",
                               
                              ),
                            ),
                            StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2.6,
                                child: Type2(
                                  img: "assets/health.jpg",
                                
                                  catName: "Health News",
                                  startingP: "Starting Rs 10000",
                            
                                )),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.4,
                              child: Type2(
                                img: "assets/scienceNews.jpg",
                             
                                catName: "Science News",
                                startingP: "Starting Rs 10000",
                               
                              ),
                            ),
                            StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2.2,
                                child: Type2(
                                  img: "assets/techNews.jpg",
                                
                                  catName: "Tech News",
                                  startingP: "Starting Rs 1000",
                                )),
                           
                          ],
                        ),
                   ),
                     

                  

                ],
              ),
            ],
          )
          ) ,
      ),
    );
  }
}