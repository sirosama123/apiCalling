import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class MyApp2 extends StatefulWidget {


  MyApp2({ Key? key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  // final List<Color> colors = [
  //   Colors.red,
  //   Colors.orange,
  //   Colors.yellow,
  //   Colors.green,
  //   Colors.blue,
  //   Colors.indigo,
  //   Colors.purple,
  // ];
  final List<String> imgAddress = [
    "assets/bussinessNews.jpg",
    "assets/generalNews.jpg",
    "assets/health.jpg",
    "assets/scienceNews.jpg",
    "assets/techNews.jpg",
  ];

  bool _isPlaying = true;

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: CarouselSlider.builder(
              
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return GestureDetector(
                  onTap: (){
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) => PhotoViewer(list1: imgAddress)),);
                    // print( imgAddress[index]);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(imgAddress[index]),fit: BoxFit.cover)
                    ),
                    
                  ),
                );
              },
              slideTransform: CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 10),
                indicatorBorderColor: Color(0xffD0D5F1),
              ),
              itemCount: imgAddress.length,
              initialPage: 0,
              enableAutoSlider: true,
              
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: Align(
          //     child: ConstrainedBox(
          //       constraints: BoxConstraints(minWidth: 240, maxWidth: 600),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           IconButton(
          //             iconSize: 48,
          //             icon: Icon(Icons.skip_previous),
          //             onPressed: () {
          //               _sliderController.previousPage();
          //             },
          //           ),
          //           IconButton(
          //             iconSize: 64,
          //             icon: Icon(
          //               _isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
          //             ),
          //             onPressed: () {
          //               setState(
          //                 () {
          //                   _isPlaying = !_isPlaying;
          //                   _sliderController.setAutoSliderEnabled(_isPlaying);
          //                 },
          //               );
          //             },
          //           ),
          //           IconButton(
          //             iconSize: 48,
          //             icon: Icon(Icons.skip_next),
          //             onPressed: () {
          //               _sliderController.nextPage();
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
  
    );
  }
}